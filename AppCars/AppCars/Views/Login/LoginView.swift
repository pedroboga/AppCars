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
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if loginViewModel.isBusy {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("appPrimary")))
                } else {
                    Text("Car App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("appPrimary"))
                        .padding(.bottom, 100)
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
                            if success {
                                username = ""
                                password = ""
                                loginViewModel.saveUserData()
                            } else {
                                showingAlert = true
                            }
                        }
                    } label: {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame(width: 260, height: 50)
                            .background((username.isEmpty || password.isEmpty) ? Color(.lightGray) : Color("appPrimary"))
                                                .cornerRadius(16)
                    }
                    .alert(loginViewModel.error, isPresented: $showingAlert) {
                        Button("Ok", role: .cancel) {}
                    }
                    .disabled(username.isEmpty || password.isEmpty)
                    .padding()
                }
            }
            .navigationDestination(isPresented: $success) {
                AppTabView(userProfile: loginViewModel.response)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
