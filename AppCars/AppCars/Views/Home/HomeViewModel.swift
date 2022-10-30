//
//  HomeViewModel.swift
//  AppCars
//
//  Created by Pedro Boga on 29/10/22.
//

import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var cars: [Car] = []
    @Published var isLoading: Bool = false
    @Published var isShowingDetail = false
    @Published var selectedCar: Car?
    
    func getCars() {
        isLoading = true
        Task {
            do {
                cars = try await Service().getCars()
                isLoading = false
            } catch {
                isLoading = false
            }
        }
    }
}
