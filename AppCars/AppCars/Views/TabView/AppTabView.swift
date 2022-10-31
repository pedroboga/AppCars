//
//  TabView.swift
//  AppCars
//
//  Created by Pedro Boga on 30/10/22.
//

import SwiftUI

struct AppTabView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var favorites = FavoritesViewModel()
    var userProfile: LoginResponse?
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
                ProfileView(userData: userProfile)
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                    .accentColor(Color("appPrimary"))
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavBackButton(dismiss: dismiss)
                }
            }
            .accentColor(Color("appPrimary"))
        }
        .navigationBarBackButtonHidden(true)
        .environmentObject(favorites)
    }
}

struct NavBackButton: View {
    @AppStorage("token", store: .standard) var token = ""
    @AppStorage("isLoggedIn", store: .standard) var isLoggedIn: Bool = false
    let dismiss: DismissAction
    var body: some View {
        Button {
            token = ""
            isLoggedIn = false
            dismiss()
        } label: {
            HStack {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                Text("Sign out")
            }
            
        }

    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
