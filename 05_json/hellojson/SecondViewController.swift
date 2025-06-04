//
//  SecondViewController.swift
//  hellojson
//

import UIKit

class SecondViewController: UIViewController {

    private var user: UserModel?
    private var heightText: String {
        guard let height = self.user?.height else {
            return "Unknown"
        }
        return "\(height) Cm"
    }

    convenience init(user: UserModel?) {
        self.init()
        self.user = user
    }

    override func viewDidLoad() {
        self.view.backgroundColor = .white

        let nameLabel = UILabel()
        nameLabel.text = self.user?.name
        nameLabel.textColor = UIColor.blue
        nameLabel.backgroundColor = UIColor.yellow
        nameLabel.font = UIFont.boldSystemFont(ofSize: 100)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -1),
        ])

        let heightLabel = UILabel()
        heightLabel.text = self.heightText
        heightLabel.textColor = UIColor.blue
        heightLabel.backgroundColor = UIColor.yellow
        heightLabel.font = UIFont.boldSystemFont(ofSize: 100)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(heightLabel)

        NSLayoutConstraint.activate([
            heightLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            heightLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }

}
