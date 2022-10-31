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
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedCar = car
                        }
                }
                .listStyle(.plain)
                .navigationTitle("Cars")
                .disabled(viewModel.isShowingDetail)
            }
            .task {
                viewModel.getCars()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            if viewModel.isShowingDetail {
                CarDetailView(car: viewModel.selectedCar!, isShowingDetail: $viewModel.isShowingDetail, isFavorite: $viewModel.isFavorite)
            }
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("appPrimary")))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
