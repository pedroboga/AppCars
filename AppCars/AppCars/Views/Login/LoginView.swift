//
//  LoginView.swift
//  AppCars
//
//  Created by Pedro Boga on 28/10/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    @State var success: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if loginViewModel.isBusy {
                    ProgressView()
                } else {
                    TextField("Username", text: $loginViewModel.username)
                    SecureField("Password", text: $loginViewModel.password)
                    Button("Login") {
                        Task {
                            success = await loginViewModel.login()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationDestination(isPresented: $success) {
                HomeView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
