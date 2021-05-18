//
//  Staging.swift
//  book-app
//
//  Created by Kyle Sherrington on 2021-05-18.
//

import SwiftUI

struct Staging: View {
    
    @EnvironmentObject var model:ViewModel
    @State var rating = 1
    
    var book:Book
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            NavigationLink(destination: PagesView(book: book)) {
                
                VStack {
                    Text("Read Now!")
                    
                    Image("cover\(book.id)")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 50)
                }
            }
            
            
            Spacer()
            
            Text("Mark for later!")
                .bold()
            
            Button(action: { model.updateFavourite(forId: book.id) },
                   label: {
                    Image(systemName: book.isFavourite ? "star.fill" : "star")
                   })
                .accentColor(.yellow)
            
            Spacer()
            
            Text("Rate \(book.title)")
                .bold()
            
            Picker("Rate book", selection: $rating) {
                ForEach(1..<6) {index in
                    Text("\(index)").tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding([.leading, .trailing, .bottom], 60)
            .onChange(of: rating, perform: { value in
                model.updateRating(forId: book.id, rating: rating)
            })
            
        }
        .onAppear { rating = book.rating }
        .navigationBarTitle("\(book.title)")
    }
}

struct Staging_Previews: PreviewProvider {
    static var previews: some View {
        Staging(book: Book())
            .environmentObject(ViewModel())
    }
}
