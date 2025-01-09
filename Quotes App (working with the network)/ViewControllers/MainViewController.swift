//
//  ViewController.swift
//  Quotes App (working with the network)
//
//  Created by Sasha on 9.01.25.
//

import UIKit

enum Cells {
    case cellOne

    var identifier: String {
        return CustomCell.reuseIdentifier
    }
}

final class MainViewController: UIViewController {

    var quotes: Quotes?

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground

        updateUI()
        fetchQuotes()
    }


}

private extension MainViewController {

    func updateUI() {
        setupTableView()
    }


    func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 20
        
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(
            CustomCell.self,
            forCellReuseIdentifier: Cells.cellOne.identifier
        )

        setupConstrainsTableView()
    }

    func setupConstrainsTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

}


#Preview {
    let view = MainViewController()
    view
}

