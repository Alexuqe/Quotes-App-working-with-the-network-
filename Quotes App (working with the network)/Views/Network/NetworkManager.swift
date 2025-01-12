//
//  NetworkManager.swift
//  Quotes App (working with the network)
//
//  Created by Sasha on 11.01.25.
//


import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {

    static let shared = NetworkManager()

    private init() {}


    func fetch(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }

    func fetch<T: Decodable>(type: T.Type, from url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {

        URLSession.shared.dataTask(with: url) { [ weak self ] data, _, error in
            guard self != nil else { return }
            guard let data else {
                print(error?.localizedDescription ?? " Error ")
                return
            }

            do {
                let dataModel = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataModel))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }

    

}
