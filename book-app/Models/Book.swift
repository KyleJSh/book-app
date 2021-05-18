//
//  Book.swift
//  book-app
//
//  Created by Kyle Sherrington on 2021-05-17.
//

import Foundation

struct Book:Identifiable, Decodable {
    
    var title = "title"
    var author = "author"
    var isFavourite = false
    var currentPage = 0
    var rating = 2
    var id = 1
    var content = ["I'm the body."]
}
