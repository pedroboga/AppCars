//
//  LoginViewModel.swift
//  AppCars
//
//  Created by Pedro Boga on 28/10/22.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @AppStorage("token", store: .standard) var token = ""
    @Published var isAuth: Bool = false
    var username = ""
    var password = ""
    
    func login() {
        Service().login(username: username, password: password) { result in
            switch result {
            case .success(let token):
                print(token)
                self.token = token
                DispatchQueue.main.async {
                    self.isAuth = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
