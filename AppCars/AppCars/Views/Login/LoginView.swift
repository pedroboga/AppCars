//
//  LoginView.swift
//  AppCars
//
//  Created by Pedro Boga on 28/10/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    @State private var username = ""
    @State private var password = ""
    @State var success: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if loginViewModel.isBusy {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("appPrimary")))
                } else {
                    TextField("Username", text: $username)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(lineWidth: 1)
                        )
                        .padding(.trailing, 10)
                        .padding(.leading,10)
                        .padding(.bottom, 5)
                    SecureField("Password", text: $password)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(lineWidth: 1)
                        )
                        .padding(.trailing, 10)
                        .padding(.leading,10)
                    Button {
                        Task {
                            success = await loginViewModel.login(username: username, password: password)
                        }
                    } label: {
                        //DetailButton(buttonType: .login)
                        Text("Login")
                    }
                    .foregroundColor(.white)
                    .frame(width: 260, height: 50)
                    .background((username.isEmpty || password.isEmpty) ? Color(.lightGray) : Color("appPrimary"))
                                        .cornerRadius(16)
                    
                    .disabled(username.isEmpty || password.isEmpty)
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
