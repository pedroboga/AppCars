//
//  Service.swift
//  AppCars
//
//  Created by Pedro Boga on 28/10/22.
//

import SwiftUI

enum ApiError: Error {
    case invalidUrl
    case invalidUser
    case errorData
}

struct LoginBody: Codable {
    let username: String
    let password: String
}

class Service {
    @AppStorage("token", store: .standard) var token = ""
    static let baseURL = "https://carros-springboot.herokuapp.com/api/v2"
    private let login = baseURL + "/login"
    private let list = baseURL + "/carros"
    
    func login(username: String, password: String) async throws -> LoginResponse {
        guard let url = URL(string: login) else {
            throw ApiError.invalidUrl
        }
        let body = LoginBody(username: username, password: password)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(LoginResponse.self, from: data)
        } catch {
            throw ApiError.invalidUser
        }
    }
    
    func getCars() async throws -> [Car] {
        guard let url = URL(string: list) else {
            throw ApiError.invalidUrl
        }
        var request = URLRequest(url: url)
        //request.httpMethod = "GET"
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Car].self, from: data)
        } catch {
            throw ApiError.errorData
        }
    }
}
