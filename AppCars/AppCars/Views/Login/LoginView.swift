//
//  LoginView.swift
//  AppCars
//
//  Created by Pedro Boga on 28/10/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        Form {
            HStack {
                Spacer()
                Image(systemName: "lock.fill")
            }
            TextField("Username", text: $loginViewModel.username)
            SecureField("Password", text: $loginViewModel.password)
            
            HStack {
                Spacer()
                Button("Login") {
                    loginViewModel.login()
                }
                Spacer()
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
