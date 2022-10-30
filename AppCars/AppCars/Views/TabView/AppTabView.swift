//
//  TabView.swift
//  AppCars
//
//  Created by Pedro Boga on 30/10/22.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("Favorites")
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            Text("Account")
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
        .accentColor(Color("appPrimary"))
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
