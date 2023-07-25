//
//  Constants.swift
//  newproject
//
//  Created by New User on 7/20/23.
//

import Foundation

let ONBOARDING_SHOWN_KEY: String = "onboardingShown"



let userMainDevice: User = {
    var thisUser = User()
    thisUser.allAbumCategories = [Album(id: "", name: "dip", icon:"", items: [], size:10, isLocked: false)]
    return thisUser

    
}()
