//
//  ProfileView.swift
//  AppCars
//
//  Created by Pedro Boga on 30/10/22.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView {
//            VStack {
//                AsyncImage(url: URL(string: userData?.urlFoto ?? ""))
//                    .frame(width: 200, height: 200)
//                    .aspectRatio(contentMode: .fit)
//                    .clipShape(Circle())
//                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                    .shadow(radius: 10)
//                Text(userData?.nome ?? "")
//                Text(userData?.login ?? "")
//                Text(userData?.email ?? "")
//            }
            VStack {
                AsyncImage(url: URL(string: viewModel.userData?.urlFoto ?? ""))
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 10)
                Text(viewModel.userData?.nome ?? "")
                Text(viewModel.userData?.login ?? "")
                Text(viewModel.userData?.email ?? "")
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.getUserData()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
