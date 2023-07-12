//
//  onboardingModel.swift
//  newproject
//
//  Created by New User on 7/12/23.
//

import Foundation
import SwiftUI

struct AppOnboardingModel:Hashable,Identifiable {
    static let instance = AppOnboardingModel(id: 0, imageName: "", title: "", subTitle: "")
    
    let id: Int
    let imageName:String
    let title:String
    let subTitle:String
    
    static let list:[AppOnboardingModel] = [
        AppOnboardingModel(id: 0, imageName: "1", title: "Strong Security", subTitle: "Protect your album with separate password\nfor each album"),
        AppOnboardingModel(id: 1, imageName: "2", title: "Secure Cloud Storage", subTitle:"Protect your album with separate password\nfor each album"),
        AppOnboardingModel(id: 2, imageName: "3", title: "Intruder Alerts", subTitle:"Snap a secret photo and record the time & incorrect PIN attempts by would-be intruders"),
        AppOnboardingModel(id: 3, imageName: "4", title: "Decoy Vault", subTitle:"Create a second PIN that opens to decoy\nphoto vault with its own albums and content."),
        AppOnboardingModel(id: 4, imageName: "5", title: "Password Proceted Album", subTitle:"Protect your album with separate password\nfor each album"),
    ]
    
    
}
