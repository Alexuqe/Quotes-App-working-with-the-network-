//
//  NetworkManager.swift
//  Quotes App (working with the network)
//
//  Created by Sasha on 10.01.25.
//

import Foundation

extension MainViewController {

    func fetchQuotes() {
        URLSession.shared.dataTask(with: Links.quotes.url) { [weak self] data, response, error in
            guard let self else { return }
            guard let data else {
                print(error?.localizedDescription ?? "Error")
                return
            }

            do {
                let networkQuote = try JSONDecoder().decode(Quotes.self, from: data)
                self.quotes = networkQuote

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }







}

