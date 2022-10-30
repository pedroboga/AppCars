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
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("appPrimary")))
                } else {
                    TextField("Username", text: $loginViewModel.username)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(lineWidth: 1)
                        )
                        .padding(.trailing, 10)
                        .padding(.leading,10)
                        .padding(.bottom, 5)
                    SecureField("Password", text: $loginViewModel.password)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(lineWidth: 1)
                        )
                        .padding(.trailing, 10)
                        .padding(.leading,10)
//                    Button("Login") {
//                        Task {
//                            success = await loginViewModel.login()
//                        }
//                    }
//                    .buttonStyle(PlainButtonStyle())
                    Button {
                        Task {
                            success = await loginViewModel.login()
                        }
                    } label: {
                        DetailButton(buttonType: .login)
                    }
                    .padding()

                }
            }
            .navigationDestination(isPresented: $success) {
                AppTabView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
