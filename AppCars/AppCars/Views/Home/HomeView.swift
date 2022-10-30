//
//  HomeView.swift
//  AppCars
//
//  Created by Pedro Boga on 29/10/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.cars) { car in
                    CarListCell(car: car)
                }
                .navigationTitle("Cars")
            }
            .task {
                viewModel.getCars()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
