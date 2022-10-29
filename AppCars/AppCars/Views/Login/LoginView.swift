//
//  LoginView.swift
//  AppCars
//
//  Created by Pedro Boga on 28/10/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    @State var success: Bool? = false
    
    var body: some View {
        VStack {
            if loginViewModel.isBusy {
                ProgressView()
            } else {
                NavigationView {
                    Form {
                        TextField("Username", text: $loginViewModel.username)
                        SecureField("Password", text: $loginViewModel.password)
                        
                        HStack {
                            Spacer()
                            NavigationLink(destination: HomeView(), tag: true, selection: $success) {
                                Button("Login") {
                                    Task {
                                        var response = await loginViewModel.login()
                                        switch response {
                                        case .success(true):
                                            self.success = true
                                        case .failure(let error):
                                            print(error.localizedDescription)
                                        case .success(false):
                                            print("Erro desconhecido")
                                        }
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
