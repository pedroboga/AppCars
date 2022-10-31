//
//  TabView.swift
//  AppCars
//
//  Created by Pedro Boga on 30/10/22.
//

import SwiftUI

struct AppTabView: View {
    @Environment(\.dismiss) private var dismiss
    var userProfile: LoginResponse?
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                Text("Favorites")
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
    }
}

struct NavBackButton: View {
    let dismiss: DismissAction
    var body: some View {
        Button {
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
