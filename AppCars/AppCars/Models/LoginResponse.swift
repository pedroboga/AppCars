//
//  LoginResponse.swift
//  AppCars
//
//  Created by Pedro Boga on 29/10/22.
//

import Foundation

struct LoginResponse: Codable {
    let id: Int?
    let login: String?
    let nome: String?
    let email: String?
    let urlFoto: String?
    let token: String?
    let roles: [String?]
}
