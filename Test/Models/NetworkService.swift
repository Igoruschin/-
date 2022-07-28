//
//  NetworkService.swift
//  Test
//
//  Created by Игорь Ущин on 28.07.2022.
//

import Foundation

class NetworkService {
    
    func jsonRequest(completion: @escaping (Swift.Result<Company, Error>) -> Void) {
        let urlString = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else { return }
                do {
                    let json = try JSONDecoder().decode(Company.self, from: data)
                    completion(.success(json))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
