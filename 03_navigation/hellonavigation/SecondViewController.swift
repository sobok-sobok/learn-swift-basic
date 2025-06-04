//
//  SecondViewController.swift
//  hellonavigation
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        self.view.backgroundColor = .white

        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill

        let image = UIImage(named: "splash")
        imageView.image = image

        self.view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }

}
