//
//  FavoritesView.swift
//  AppCars
//
//  Created by Pedro Boga on 31/10/22.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: FavoritesViewModel
    var body: some View {
        NavigationView {
            VStack {
                ForEach(favorites.items) { item in
                    Text(item.nome ?? "")
                }
            }
        }
        .onAppear {
            favorites.getItems()
        }
    }
}
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
