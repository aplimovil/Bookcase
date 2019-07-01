import Foundation

// Get a URL to Application Support directory
private var appSupportDirectory:URL = {
    let url = FileManager().urls(for:.applicationSupportDirectory,in: .userDomainMask).first!
    //Checks if directory exists
    if !FileManager().fileExists(atPath: url.path) {
        //Creates directory if necessary
        do {
            try FileManager().createDirectory(at: url,
                                              withIntermediateDirectories: false)
        } catch let error as NSError {
            print("\(error.localizedDescription)")
        }
        
    }
    //Returns the path
    return url
}()

//Gets URL to Books.db file
private var booksFile:URL = {
    let filePath = appSupportDirectory.appendingPathComponent("Books").appendingPathExtension("db")
    print(filePath)
    if !FileManager().fileExists(atPath: filePath.path) {
        if let bundleFilePath = Bundle.main.resourceURL?.appendingPathComponent("Books").appendingPathExtension("db") {
            do {
                try FileManager().copyItem(at: bundleFilePath, to: filePath)
            } catch let error as NSError {
                //fingers crossed
                print("\(error.localizedDescription)")
            }
        }
    }
    return filePath
}()

//Class to handle operations over the books collection
class BooksManager {
    
    //Store the books collection
    private lazy var books:[Book] = self.loadBooks()
    //Store the number of books in the collection
    var bookCount:Int {return books.count}		
    
    //Get a book from the collection at a specific position
    func getBook(at index:Int)->Book {
        return books[index]
    }
    
    //Return the books collection
    private func loadBooks()->[Book] {
        //Loads the books from database
        return retrieveBooks() ?? []
    }
    
    //Add a book to the collection
    func addBook(_ book:Book) {
        /*As the book object is updated with the ID, you’ll need to mark the argument with an ampersand
         to make this parameter mutable, so you’ll need to reassign it as a variable*/
        var book = book
        //Adds the record in the database
        SQLAddBook(book: &book)
        //Updates the array with GUI update purposes
        books.append(book)
    }
    
    //Update a book of the collection
    func updateBook(at index: Int, with book: Book) {
        //Updates the Book in the database
        SQLUpdateBook(book: book)
        //Updates the Book in the array for GUI update purposes
        books[index] = book
    }
    
    //Remove a book of the collection
    func removeBook(at index: Int) {
        //Deletes the Book in the array for GUI update purposes
        let bookToRemove = books.remove(at: index)
        //Deletes the Book in the database
        SQLRemoveBook(book: bookToRemove)
    }
    
    
    //Return a dummny collection of books according to Book structure
    private func sampleBooks()->[Book] {
        return [
            Book(title: "Great Expectations", author: "Charles Dickens", rating: 5, isbn: "9780140817997", notes: "Gift from Papa"),
            Book(title: "Don Quixote", author: "Miguel De Cervantes", rating: 4, isbn: "9788471890153", notes: ""),
            Book(title: "Robinson Crusoe", author: "Daniel Defoe", rating: 5, isbn: "", notes: ""),
            Book(title: "Gulliver's Travels", author: "Jonathan Swift", rating: 5, isbn: "", notes: ""),
            Book(title: "Emma", author: "Jane Austen", rating: 5, isbn: "", notes: ""),
            Book(title: "To Kill a Mockingbird", author: "Harper Lee", rating: 5, isbn: "", notes: ""),
            Book(title: "Animal Farm", author: "George Orwell", rating: 4, isbn: "", notes: ""),
            Book(title: "Gone with the Wind", author: "Margaret Mitchell", rating: 5, isbn: "", notes: ""),
            Book(title: "The Fault in Our Stars", author: "John Green", rating: 5, isbn: "", notes: ""),
            Book(title: "The Da Vinci Code", author: "Dan Brown", rating: 5, isbn: "", notes: ""),
            Book(title: "Les Misérables ", author: "Victor Hugo", rating: 5, isbn: "", notes: ""),
            Book(title: "Lord of the Flies ", author: "William Golding", rating: 5, isbn: "", notes: ""),
            Book(title: "The Alchemist", author: "Paulo Coelho", rating: 5, isbn: "", notes: ""),
            Book(title: "Life of Pi", author: "Yann Martel", rating: 5, isbn: "", notes: ""),
            Book(title: "The Odyssey", author: "Homer", rating: 5, isbn: "", notes: ""),
            
            //More books
        ]
    }
    
    //Uses the FMDB wrapper to get a reference to the Books database on the specific path
    func getOpenDB()->FMDatabase? {
        let db = FMDatabase(path: booksFile.path)
        guard db.open() else {
            print("Unable to open database")
            return nil
        }
        return db
    }
    
    //Retrieves all books from Books database
    func retrieveBooks() -> [Book]? {
        //Opens a connection to DB
        guard let db = getOpenDB() else { return nil }
        var books:[Book] = []
        do {
            //Queries database for all books
            let rs = try db.executeQuery(
                /*As long as there is no a explicit ID field in database, SQLite creates a ROWID field
                 to store an autoincrement ID for the database records*/
                "SELECT *, ROWID FROM Books", values: nil)
            //Iterates throughout the Result Set
            while rs.next() {
                //Creates a Book object from Result Set
                if let book = Book(rs: rs) {
                    //Add to Books array for updating the interface
                    books.append(book)
                }
            }
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        //Closes the connection to database
        db.close()
        return books
    }
    
    //Adds a Book to the database
    /*All parameters passed into a Swift function are constants, so you can’t change them.
     You can pass in one or more parameters as inout, which means they can be changed inside your function,
     and those changes reflect in the original value outside the function
     In this case, by using the Book parameter as inout enables you to update the Id field of the Book object
     with the value read from the database*/
    func SQLAddBook(book:inout Book) {
        //Opens a connection to the database
        guard let db = getOpenDB() else { return  }
        do {
            //Performs an update operation on the database
            try db.executeUpdate(
                //Add a Book record
                "insert into Books (title, author, rating, isbn, notes) values (?, ?, ?, ?, ?)",
                values: [book.title, book.author, book.rating, book.isbn, book.notes]
            )
            //Gets the ROWID and updates the Id field of the book object
            book.id = Int(db.lastInsertRowId)
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        //Closes the connection to the database
        db.close()
    }
    
    //Removes a Book from the database
    func SQLRemoveBook(book:Book) {
        //Opens a connection to the database
        guard let db = getOpenDB() else { return  }
        do {
            //Performs an update operation on the database
            try db.executeUpdate(
                //Deletes the record from database
                "delete from Books where ROWID = ?",
                values: [book.id]
            )
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        //Closes the connection to the database
        db.close()
    }
    
    //Updates a Book in the database
    func SQLUpdateBook(book:Book) {
        guard let db = getOpenDB() else { return  }
        do {
            //Performs an update operation on the database
            try db.executeUpdate(
                //Updates the record in the database
                "update Books SET title = ?, author = ?, rating = ?, isbn = ?, notes = ? WHERE ROWID = ?", values: [book.title, book.author, book.rating, book.isbn, book.notes, book.id]
            )
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        //Closes the connection to the database
        db.close()
    }
    
    
}
