//
//  SecondViewController.swift
//  hellotableview
//

import UIKit

class SecondViewController: UIViewController {

    private var text: String?

    convenience init(text: String?) {
        self.init()
        self.text = text
    }

    override func viewDidLoad() {
        self.view.backgroundColor = .white

        let label = UILabel()
        label.text = self.text
        label.textColor = .blue
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }

}
