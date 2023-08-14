//
//  CollectionViewExtensioncontroller.swift
//  newproject
//
//  Created by New User on 8/12/23.
//

import Foundation
import UIKit

// MARK: - Create collectionViewController  Extension

extension UIViewController {
    // create data of onboading model
    
    func onBoradingModelData()->[onBoardingModel] {
        let  onboading1 = onBoardingModel(onboardingImage: UIImage(named:"1")!, onboardingText: "Strong Security", onboradingSubTitle: "Protect your album with separate password\nfor each album")
        let onboading2 = onBoardingModel(onboardingImage:UIImage(named: "2")!, onboardingText: "Secure Cloud Storage", onboradingSubTitle:"Protect your album with separate password\nfor each album")
        let onboarding3 = onBoardingModel(onboardingImage: UIImage(named: "3")!, onboardingText: "Intruder Alerts", onboradingSubTitle: "Snap a secret photo and record the time & incorrect PIN attempts by would-be intruders")
        let onboading4 = onBoardingModel(onboardingImage: UIImage(named: "4")!, onboardingText: "Decoy Vault", onboradingSubTitle: "Create a second PIN that opens to decoy\nphoto vault with its own albums and content.")
        let onboarding5 = onBoardingModel(onboardingImage: UIImage(named: "5")!, onboardingText: "Password Proceted Album", onboradingSubTitle: "Protect your album with separate password\nfor each album")
        return [onboading1,onboading2,onboarding3,onboading4,onboarding5]
    }
}

// MARK: - Main Page ViewController Extension

extension UIViewController {
    
    func albums() ->[Album] {
      let album1 = Album(id: "", icon: " 📕", name: "Main Album", size:"\(200) items・\(200) mb", isLocked:false, items: [])
        let album2 = Album(id: "", icon: "🔒", name: "Locked Album", size:"Locked", isLocked:true, items: [])
        let album3 = Album(id: "", icon: "📜", name: "Texts Limit 1 2 3 ...", size: "\(7.7)k items・(3.5) gb", isLocked:false, items: [])
        let album4 = Album(id: "", icon: "📁",name: "Albums", size:"Empty", isLocked:true, items: [])
        let album5 = Album(id: "", icon: "🚝", name: "Train", size:"\(300) items・\(300) mb", isLocked:true, items: [])
        let album6 = Album(id: "", icon: "📙", name: "Open Book", size:"\(100) items・\(100) mb", isLocked:false, items: [])
        let album7 = Album(id: "", icon: "🔒", name: "Items", size:" Show Locked Here", isLocked:true, items: [])
        let album8 = Album(id: "", icon: "🗃", name: "Texts Limit 4 5 6 ...", size: "\(8.7)k items・(5.5) gb", isLocked:false, items: [])
        let album9 = Album(id: "", icon: "📋",name: "Empty Album", size:" Find Empty", isLocked:true, items: [])
        let album10 = Album(id: "", icon: "🗄", name: "Travel", size:"\(400) items・\(400) mb", isLocked:true, items: [])
        return [album1,album2,album3,album4,album5,album6,album7,album8,album9,album10]
    }
    
    func Items() -> [Item] {
        let item1 = Item(id: "", name: "Bangladesh Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item2 = Item(id: "", name: "American Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item3 = Item(id: "", name: "Indian Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item4 = Item(id: "", name: "Australian Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item5 = Item(id: "", name: "Bangladesh Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item6 = Item(id: "", name: "American Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item7 = Item(id: "", name: "Indian Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item8 = Item(id: "", name: "Australian Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item9 = Item(id: "", name: "Bangladesh Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item10 = Item(id: "", name: "American Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item11 = Item(id: "", name: "Indian Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item12 = Item(id: "", name: "Australian Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item13 = Item(id: "", name: "Bangladesh Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item14 = Item(id: "", name: "American Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item15 = Item(id: "", name: "Indian Nature", type: "", Size: 0, resource: "Rectangle 10")
        let item16 = Item(id: "", name: "Australian Nature", type: "", Size: 0, resource: "Rectangle 10")
        return[item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11,item12,item13,item14,item15,item16]
    }
    
}
