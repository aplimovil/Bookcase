//
//  BooksManager_database_path_definition.swift
//  Bookcase
//
//  Created by Francisco Martinez on 7/1/19.
//  Copyright © 2019 Craig Grummitt. All rights reserved.
//

import Foundation

/************************************* Add this code ****************************************/

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

/************************************* Add this code ****************************************/


//Class to handle operations over the books collection
class BooksManager {

}
