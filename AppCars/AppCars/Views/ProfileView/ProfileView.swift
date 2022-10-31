//
//  ProfileView.swift
//  AppCars
//
//  Created by Pedro Boga on 30/10/22.
//

import SwiftUI

struct ProfileView: View {
    var userData: LoginResponse?
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: userData?.urlFoto ?? ""))
            Text(userData?.nome ?? "")
            Text(userData?.login ?? "")
            Text(userData?.email ?? "")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
