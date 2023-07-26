//
//  Constants.swift
//  newproject
//
//  Created by New User on 7/20/23.
//

import Foundation
import UIKit

let ONBOARDING_SHOWN_KEY: String = "onboardingShown"


let usermainDevice:User = {
    var thisUser = User()
    thisUser.allAlbumCategories = UIViewController().catagorie()
    
    return thisUser
}()
