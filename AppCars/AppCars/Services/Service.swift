//
//  Service.swift
//  AppCars
//
//  Created by Pedro Boga on 28/10/22.
//

import SwiftUI

enum ApiError: String, Error, LocalizedError {
    case invalidUrl = "Erro ao conectar com o servidor. Tente novamente mais tarde."
    case invalidUser = "As credenciais informadas não estão corretas."
    case errorData = "Erro ao recuperar os dados. Tente novamente mais tarde."
    
    var errorDescription: String? {
        self.rawValue
    }
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
    private let cache = NSCache<NSString, UIImage>()
    
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
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Car].self, from: data)
        } catch {
            throw ApiError.errorData
        }
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
