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
                if favorites.items.count > 0 {
                    List(favorites.items) { car in
                        HStack {
                            CarRemoteImage(urlString: car.urlFoto ?? "")
                                .frame(width: 50, height: 20, alignment: .leading)
                            Text(car.nome ?? "")
                        }
                    }
                    .listStyle(.automatic)
                } else {
                    Text("Marque um carro preferido para adicionar a sua lista de favoritos!")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("appPrimary"))
                }
            }
            .navigationTitle("Favoritos")
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
