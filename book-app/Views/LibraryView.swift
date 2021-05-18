//
//  LibraryView.swift
//  book-app
//
//  Created by Kyle Sherrington on 2021-05-17.
//

import SwiftUI

struct LibraryView: View {
    
    @EnvironmentObject var model:ViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach (model.books) { book in
                        NavigationLink(destination: Staging(book: book)) {
                            BookCoverView(book: book)
                        }
                     
                    }
                }
                .padding(.top)
            }
            .navigationTitle("My Library")
        }
        
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environmentObject(ViewModel())
    }
}
