//
//  FavoritesViewModel.swift
//  AppCars
//
//  Created by Pedro Boga on 31/10/22.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var items: [Car] = []
    let itemsKey: String = "favorites"
    
    func addItem(car: Car) {
        items.append(car)
        saveItems()
    }
    
    func removeItem(car: Car) {
        items = items.filter { $0.id != car.id }
        saveItems()
    }
    
    func checkIsFavorite(car: Car) -> Bool {
        getItems()
        var item = items.filter { $0.id == car.id }
        return !item.isEmpty
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let favorites = try? JSONDecoder().decode([Car].self, from: data)
        else { return }
        self.items = favorites
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
