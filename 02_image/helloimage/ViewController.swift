//
//  ViewController.swift
//  helloimage
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView()
        imageView.clipsToBounds = true
        // imageView.backgroundColor 가 UIColor 타입이기 때문에 생략 가능 UIColor.gray → .gray
        // imageView.backgroundColor = UIColor.gray
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        // imageView.contentMode 가 UIView.ContentMode 타입이기 때문에 생략 가능 UIView.ContentMode.scaleAspectFill → .scaleAspectFill
        // imageView.contentMode = UIView.ContentMode.scaleAspectFill
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
