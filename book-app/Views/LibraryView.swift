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
        
        ScrollView {
            LazyVStack {
                ForEach (model.books) { index in
                    
                   Text("hello world")
                    
                }
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environmentObject(ViewModel())
    }
}
