//
//  ViewController.swift
//  hellotableview
//

import UIKit

class ViewController: UINavigationController {

    required init?(coder aDecoder: NSCoder) {
        let secondViewController = SecondViewController()
        super.init(rootViewController: FirstViewController())
    }

}
