//
//  ViewController.swift
//  hellolibrary
//

import Alamofire
import Kingfisher
import SnapKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "Hello library!"
        label.textColor = .blue
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: 50)
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.centerY.equalTo(self.view.snp.centerY)
        }

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        self.view.insertSubview(imageView, belowSubview: label)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let imageURLString = "https://plus.unsplash.com/premium_photo-1723601193263-6b022f5c8eb5?q=80&w=2883&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        if let url = URL(string: imageURLString) {
            imageView.kf.setImage(with: url)
        }

        self.loadUserList()
    }

    func loadUserList() {
        let urlString = "https://raw.githubusercontent.com/sobok-sobok/learn-swift-basic/refs/heads/main/05_json/json/users.json"
        AF.request(urlString).responseDecodable(of: UserListModel.self, queue: DispatchQueue.global()) { response in
            guard let userListModel = response.value else {
                print("데이터 없음")
                return
            }

            for user in userListModel.users {
                print("이름: \(user.name), 키: \(user.height)")
            }
        }
    }

}
