//
//  FirstViewController.swift
//  hellonavigation
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        self.view.backgroundColor = .white

        let presentButton = UIButton()
        presentButton.layer.cornerRadius = 30
        presentButton.setTitle("Present", for: .normal)
        presentButton.addTarget(self, action: #selector(presentButtonDidSelect), for: .touchUpInside)
        presentButton.backgroundColor = .black
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(presentButton)

        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            presentButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            presentButton.widthAnchor.constraint(equalToConstant: 200),
            presentButton.heightAnchor.constraint(equalToConstant: 60),
        ])

        let pushButton = UIButton()
        pushButton.layer.cornerRadius = 30
        pushButton.setTitle("Push", for: .normal)
        pushButton.addTarget(self, action: #selector(pushButtonDidSelect), for: .touchUpInside)
        pushButton.backgroundColor = .black
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pushButton)

        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pushButton.bottomAnchor.constraint(equalTo: presentButton.topAnchor, constant: -10),
            pushButton.widthAnchor.constraint(equalToConstant: 200),
            pushButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }

    @objc func presentButtonDidSelect() {
        self.present(SecondViewController(), animated: true)
    }

    @objc func pushButtonDidSelect() {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }

}
