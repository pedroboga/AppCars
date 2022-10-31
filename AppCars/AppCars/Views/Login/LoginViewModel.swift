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
    @Published var error: String = ""
    
    func login(username: String, password: String) async -> Bool {
        isBusy = true
        //Task {
            do {
                response = try await Service().login(username: username, password: password)
                isBusy = false
                self.token = response?.token ?? ""
                return true
            } catch {
                isBusy = false
                self.error = error.localizedDescription
                return false
            }
        //}
    }
}
