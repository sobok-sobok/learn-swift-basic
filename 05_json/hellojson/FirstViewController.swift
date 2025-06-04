//
//  FirstViewController.swift
//  hellojson
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
    var userList: [UserModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)

        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
        ])

        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.loadUserList()
    }

    func loadUserList() {
        let urlString = "https://raw.githubusercontent.com/sobok-sobok/learn-swift-basic/refs/heads/main/05_json/json/users.json"
        guard let url = URL(string: urlString) else {
            print("잘못된 URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("에러 발생: \(error)")
                return
            }

            guard let data else {
                print("데이터 없음")
                return
            }

            do {
                let userListModel = try JSONDecoder().decode(UserListModel.self, from: data)
                print("디코딩 성공:")
                for user in userListModel.users {
                    print("이름: \(user.name), 키: \(user.height)")
                }
                self.userList = userListModel.users
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("디코딩 실패: \(error)")
            }
        }

        task.resume()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = self.userList[indexPath.row]
        cell.textLabel?.text = user.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = self.userList[indexPath.row]
        self.navigationController?.pushViewController(SecondViewController(user: user), animated: true)
    }

}
