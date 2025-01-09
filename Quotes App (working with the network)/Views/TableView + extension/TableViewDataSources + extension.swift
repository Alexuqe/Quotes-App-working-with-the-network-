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
        quotes?.quotes.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.cellOne.identifier, for: indexPath)
        guard let cell = cell as? CustomCell else { return UITableViewCell() }
        
        if let quoteData = quotes?.quotes[indexPath.row] {
            cell.authorLabel.text = quoteData.author
            cell.quoteLabel.text = quoteData.quote
        }

        return cell
    }
    

}
