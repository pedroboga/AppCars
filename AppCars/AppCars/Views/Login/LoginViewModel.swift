//
//  LoginViewModel.swift
//  AppCars
//
//  Created by Pedro Boga on 28/10/22.
//

import SwiftUI

@MainActor
class LoginViewModel: ObservableObject {
    @AppStorage("token", store: .standard) var token = ""
    @Published var response: LoginResponse?
    @Published var isLoggedIn: Bool = false
    @Published var isBusy: Bool = false
    var username = ""
    var password = ""
    
    func login() async -> Result<Bool, Error> {
        isBusy = true
        //Task {
            do {
                response = try await Service().login(username: username, password: password)
                isBusy = false
                self.token = response?.token ?? ""
                return .success(true)
            } catch {
                isBusy = false
                print(error.localizedDescription)
                return .failure(error.localizedDescription as! Error)
            }
        //}
    }
}
