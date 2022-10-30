//
//  Car.swift
//  AppCars
//
//  Created by Pedro Boga on 29/10/22.
//

import Foundation

struct CarResponse: Decodable {
    let request: [Car]
}

struct Car: Decodable, Identifiable {
    let id: Int
    let nome: String?
    let tipo: Tipo?
    let descricao: String?
    let urlFoto: String?
    let urlVideo: String?
    let latitude, longitude: String?
}

enum Tipo: String, Codable {
    case classicos = "classicos"
    case esportivos = "esportivos"
    case luxo = "luxo"
}

struct MockData {
    static let sampleCar = Car(id: 1, nome: "Fusca", tipo: Tipo.classicos, descricao: "Descrição do carro aqui", urlFoto: "", urlVideo: "", latitude: "", longitude: "")
}
