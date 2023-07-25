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
    thisUser.allAlbumCategories = [Catagorie](repeating:Catagorie(albums: [Album](repeating: Album(), count:10)), count:4)
    return thisUser

    
}()
