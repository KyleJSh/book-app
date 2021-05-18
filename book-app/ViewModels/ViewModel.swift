//
//  ViewModel.swift
//  book-app
//
//  Created by Kyle Sherrington on 2021-05-18.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        self.books = getLocalData()
    }
    
    /// retrieve all record data from a local JSON file with names `fileName` and extension `fileExtension`
    func getLocalData(fileName: String = "Data", fileExtension: String = "json") -> [Book] {
        
        var books = [Book]()
        
        let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        
        guard url != nil else {
            print("Couldn't get data: \(fileName).\(fileExtension) couldn't be found")
            return books
        }
        
        do {
            let data = try Data(contentsOf: url!)
            books = try JSONDecoder().decode([Book].self, from: data)
            return books
        }
        catch {
            print(error.localizedDescription)
        }
        return books
    }
    
    func updateFavourite(forId: Int) {
        
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].isFavourite.toggle()
        }
    }
    
    func updateRating(forId: Int, rating:Int) {
        
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].rating = rating
        }
    }
    
    func updatePage(forId: Int, page: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].currentPage = page
        }
    }
    
}
