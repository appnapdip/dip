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
        let item1 = Item(id: "", name: "Argentina Flag", type: "", Size: 0, resource: "Argentina")
        let item2 = Item(id: "", name: "Bangladesh Flag", type: "", Size: 0, resource: "Bangladesh")
        let item3 = Item(id: "", name: "Bhutan Flag", type: "", Size: 0, resource: "Bhutan")
        let item4 = Item(id: "", name: "Brazil Flag", type: "", Size: 0, resource: "Brazil")
        let item5 = Item(id: "", name: "China Flag", type: "", Size: 0, resource: "China")
        let item6 = Item(id: "", name: "France Flag", type: "", Size: 0, resource: "France")
        let item7 = Item(id: "", name: "Germany Flag", type: "", Size: 0, resource: "Germany")
        let item8 = Item(id: "", name: "India Flag", type: "", Size: 0, resource: "India")
        let item9 = Item(id: "", name: "Itlay Flag", type: "", Size: 0, resource: "Italy")
        let item10 = Item(id: "", name: "Portugal Flag", type: "", Size: 0, resource: "Portugal")
        let item11 = Item(id: "", name: "Srilanka Flag", type: "", Size: 0, resource: "SriLanka")
        let item12 = Item(id: "", name: "Sweden Flag", type: "", Size: 0, resource: "Sweden")
        let item13 = Item(id: "", name: "Switzerland Flag", type: "", Size: 0, resource: "Switzerland")
        let item14 = Item(id: "", name: "Uganda Flag", type: "", Size: 0, resource: "Uganda")
        return[item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11,item12,item13,item14]
    }
    
}
