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

        //MARK: Private Outlets
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension

        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 20
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

        //MARK: Properties
    var quotes: [Quote] = []

        //MARK: Private Properties
    private let networkManager = NetworkManager.shared


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground

        fetchQuotes()
        updateUI()

    }


}

    //MARK: UI Configure
private extension MainViewController {

    func updateUI() {
        setupTableView()
    }

    func setupTableView() {

        view.addSubview(tableView)

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
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -20)
        ])
    }

}


    //MARK: Network
private extension MainViewController {
    func fetchQuotes() {
        networkManager.fetch(type: Quotes.self, from: Links.quotes.url) { [weak self] result in
            guard let self else { return }

            switch result {
                case .success(let quotes):
                    self.quotes = quotes.quotes
                    tableView.reloadData()
                case .failure(let error):
                    print(error)
            }
        }
    }
}

#Preview {
    let view = MainViewController()
    view
}

