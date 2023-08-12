//
//  CollectionViewExtensioncontroller.swift
//  newproject
//
//  Created by New User on 8/12/23.
//

import Foundation
import UIKit

// MARK: - Create collectionViewController  Extension
extension collectionViewController {
    func onBoradingModelData()->[onBoardingModel] {
        let  onboading1 = onBoardingModel(onboardingImage: UIImage(named:"1")!, onboardingText: "Strong Security", onboradingSubTitle: "Protect your album with separate password\nfor each album")
        let onboading2 = onBoardingModel(onboardingImage:UIImage(named: "2")!, onboardingText: "Secure Cloud Storage", onboradingSubTitle:"Protect your album with separate password\nfor each album")
        let onboarding3 = onBoardingModel(onboardingImage: UIImage(named: "3")!, onboardingText: "Intruder Alerts", onboradingSubTitle: "Snap a secret photo and record the time & incorrect PIN attempts by would-be intruders")
        let onboading4 = onBoardingModel(onboardingImage: UIImage(named: "4")!, onboardingText: "Decoy Vault", onboradingSubTitle: "Create a second PIN that opens to decoy\nphoto vault with its own albums and content.")
        let onboarding5 = onBoardingModel(onboardingImage: UIImage(named: "5")!, onboardingText: "Password Proceted Album", onboradingSubTitle: "Protect your album with separate password\nfor each album")
        return [onboading1,onboading2,onboarding3,onboading4,onboarding5]
    }
}
