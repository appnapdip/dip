//
//  SettingsViewController.swift
//  newproject
//
//  Created by New User on 8/1/23.
//

import Foundation
import UIKit
import SwiftUI


class SettingsViewController:UIViewController {
    
    
    let logOutButton:UIButton = {
        let thisButton = UIButton().button(title:"Log Out" , titleColor:UIColor(hex:"#FFFFFF"),backgroundColor:UIColor(hex:"#FF4D4D"),font: UIFont(name:"Poppins-SemiBold", size:.init(h:16))!,cornerRadius:
                .init(h:16))
        return thisButton
        
    }()
    
    let backButton: UIButton = {
        let thisButton = UIButton().button(title:"Back" , titleColor:UIColor(hex:"#FFFFFF") , backgroundColor:UIColor(hex:"#2EA7FF"),font:UIFont(name:"Poppins-SemiBold", size:.init(h:16))!,cornerRadius: .init(h:16))
        return thisButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(logOutButton)
        let SettingsView = UIHostingController(rootView: SettingsView())
        addChild(SettingsView)
        view.addSubview(SettingsView.view)
        SettingsView.view.anchorView(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height:.init(h:UIdeviceSize.height * 0.5))
        SettingsView.didMove(toParent: self)
        
        logOutButton.anchorView(bottom:view.bottomAnchor,paddingBottom:.init(h:46),width: .init(w:158), height: .init(h:56))
        logOutButton.centerX(inView:view)
        
        
    }
    
}
