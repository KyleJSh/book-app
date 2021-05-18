//
//  PagesView.swift
//  book-app
//
//  Created by Kyle Sherrington on 2021-05-18.
//

import SwiftUI

struct PagesView: View {
    
    @EnvironmentObject var model:ViewModel
    
    @State private var page = 0
    
    var book:Book
    
    var body: some View {
        TabView (selection: $page) {
            ForEach(book.content.indices) {index in
                VStack (alignment: .center) {
                    Text(book.content[index])
                        .tag(index)
                    
                    Spacer()
                    
                    Text("\(page + 1)")
                    
                }
            }
            .padding()
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onChange(of: page, perform: { value in
            model.updatePage(forId: book.id, page: page)
        })
        .onAppear { page = book.currentPage }
        
    }
}

struct PagesView_Previews: PreviewProvider {
    static var previews: some View {
        PagesView(book: Book())
            .environmentObject(ViewModel())
    }
}
