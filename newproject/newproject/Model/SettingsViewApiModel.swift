//
//  SettingsViewApiModel.swift
//  newproject
//
//  Created by New User on 7/31/23.
//

import Foundation

// MARK: GitHubUsers
struct GitHubUsers: Codable {
    let login:String
    let avatarUrl:String
    let bio:String
}
