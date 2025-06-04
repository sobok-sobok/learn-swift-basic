//
//  UserModel.swift
//  hellojson
//

import Foundation

struct UserModel: Codable {
    let name: String
    let height: Int
}

struct UserListModel: Codable {
    let users: [UserModel]
}
