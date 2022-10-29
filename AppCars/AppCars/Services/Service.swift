//
//  Service.swift
//  AppCars
//
//  Created by Pedro Boga on 28/10/22.
//

import Foundation

enum AuthError: Error {
    case invalidUser
}

struct LoginBody: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let id: Int?
    let login: String?
    let nome: String?
    let email: String?
    let urlFoto: String?
    let token: String?
    let roles: [String?]
}

class Service {
    func login(username: String, password: String, completion: @escaping(Result<String, AuthError>) -> Void) {
        guard let url = URL(string: "https://carros-springboot.herokuapp.com/api/v2/login") else { return }
        
        let body = LoginBody(username: username, password: password)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidUser))
                return
            }
            
            guard let token = loginResponse.token else {
                completion(.failure(.invalidUser))
                return
            }
            
            completion(.success(token))
            
        }.resume()
    }
}
