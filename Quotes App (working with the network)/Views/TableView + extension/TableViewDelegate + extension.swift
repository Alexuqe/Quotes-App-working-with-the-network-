//
//  TableViewDataSource.swift
//  Quotes App (working with the network)
//
//  Created by Sasha on 9.01.25.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
