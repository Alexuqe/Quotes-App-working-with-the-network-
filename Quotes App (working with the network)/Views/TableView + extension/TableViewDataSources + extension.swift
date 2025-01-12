//
//  TableViewDelegate + extension.swift
//  Quotes App (working with the network)
//
//  Created by Sasha on 9.01.25.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.cellOne.identifier, for: indexPath)
        guard let cell = cell as? CustomCell else { return UITableViewCell() }
        let quote = quotes[indexPath.row]
        cell.set(with: quote)

        return cell
    }
}

