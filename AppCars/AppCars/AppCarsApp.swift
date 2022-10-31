//
//  AppCarsApp.swift
//  AppCars
//
//  Created by Pedro Boga on 28/10/22.
//

import SwiftUI

@main
struct AppCarsApp: App {
    
    var body: some Scene {
        WindowGroup {
            AppLogger()
        }
    }
}

struct AppLogger: View {
    @AppStorage("isLoggedIn", store: .standard) var isLoggedIn: Bool = false
    
    var body: some View {
        if isLoggedIn {
            AppTabView()
        } else {
            LoginView()
        }
    }
}
