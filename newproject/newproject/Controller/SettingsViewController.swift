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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let SettingsView = UIHostingController(rootView: SettingsView())
        addChild(SettingsView)
        view.addSubview(SettingsView.view)
        SettingsView.view.anchorView(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        SettingsView.didMove(toParent: self)
        
        
    }
    
}
