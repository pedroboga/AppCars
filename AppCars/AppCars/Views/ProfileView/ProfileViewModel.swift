//
//  ProfileViewModel.swift
//  AppCars
//
//  Created by Pedro Boga on 31/10/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var userData: LoginResponse?
    
    func getUserData() {
        guard
            let data = UserDefaults.standard.data(forKey: "userData"),
            let user = try? JSONDecoder().decode(LoginResponse.self, from: data)
        else { return }
        self.userData = user
    }
}
