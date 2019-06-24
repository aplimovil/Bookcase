//
//  BookViewController_BookViewControllerDelegate_protocol_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 6/22/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

class BooksManager {
    
    /************************************ Add this code **********************************/
    
    //Remove a book of the collection
    func removeBook(at index: Int) {
        books.remove(at: index)
    }
    
    /************************************ Add this code **********************************/
    
}



class BooksTableViewController: UITableViewController {
    
    /************************************ Add this code **********************************/
    
    //Handles editing functions over the cell, e.g swiping for delete operations
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete the book from the array
            booksManager.removeBook(at: indexPath.row)
            //Delete the book from the table
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    /************************************ Add this code **********************************/
    
}






