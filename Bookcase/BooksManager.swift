import Foundation

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
        //for now, loads a dummy hard-coded books collection
        return sampleBooks()
    }
    
    //Add a book to the collection
    func addBook(_ book:Book) {
        books.append(book)
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
}
