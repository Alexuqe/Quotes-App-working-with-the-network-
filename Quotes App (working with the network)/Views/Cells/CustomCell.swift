    //
    //  Links.swift
    //  Quotes App (working with the network)
    //
    //  Created by Sasha on 9.01.25.
    //

import UIKit


final class CustomCell: UITableViewCell {

    let authorLabel = UILabel()
    let quoteLabel = UILabel()

    static let reuseIdentifier = "CustomCell"

    private let networkManager = NetworkManager.shared

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        updateUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(with quote: Quote) {
        authorLabel.text = quote.author
        quoteLabel.text = quote.quote
    }
}

private extension CustomCell {

    func updateUI() {
        layer.cornerRadius = 10

        confgiureconfigureAuthorlabel()
        configureQuotelabel()
    }

    func confgiureconfigureAuthorlabel() {
        authorLabel.font = .systemFont(ofSize: 15, weight: .medium)
        authorLabel.numberOfLines = 1
        authorLabel.adjustsFontSizeToFitWidth = true
        authorLabel.minimumScaleFactor = 0.9

        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(authorLabel)

        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])

    }

    func configureQuotelabel() {
        quoteLabel.font = .systemFont(ofSize: 12, weight: .regular)
        quoteLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        quoteLabel.numberOfLines = 0
        quoteLabel.adjustsFontSizeToFitWidth = true
        quoteLabel.minimumScaleFactor = 0.9

        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(quoteLabel)

        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 2),
            quoteLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            quoteLabel.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),
            quoteLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

}

