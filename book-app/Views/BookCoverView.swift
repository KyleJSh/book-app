//
//  BookCoverView.swift
//  book-app
//
//  Created by Kyle Sherrington on 2021-05-18.
//

import SwiftUI

struct BookCoverView: View {
    
    var book:Book
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: -5, y: 5)
            
            VStack (alignment: .leading, spacing: 10) {
                
                HStack {
                    Text(book.title)
                        .bold()
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    if book.isFavourite {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.yellow)
                    }
                }
                
                Text(book.author)
                    .italic()
                
                Image("cover\(book.id)")
                    .resizable()
                
                
            }
            .padding()
            
        }
        .accentColor(.black)
        
    }
}

struct BookCoverView_Previews: PreviewProvider {
    static var previews: some View {
        
        BookCoverView(book: Book())
    }
}
