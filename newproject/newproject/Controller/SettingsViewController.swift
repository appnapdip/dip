//
//  SettingsViewController.swift
//  newproject
//
//  Created by New User on 8/1/23.
//

import Foundation
import UIKit
import SwiftUI


class SettingsViewController:UIViewController , RemoveAleartView{
    func pressAction(firstButton: Bool) {
        self.firstButton = firstButton
    }
    
    var firstButton: Bool = true
    lazy var logOutButton:UIButton = {
        let thisButton = UIButton().button(title:"Log Out" , titleColor:UIColor(hex:"#FFFFFF"),backgroundColor:UIColor(hex:"#FF4D4D"),font: UIFont(name:"Poppins-SemiBold", size:.init(h:16))!,cornerRadius:
                .init(h:16))
      
        thisButton.addTarget(self, action: #selector(pressLogOut), for: .touchUpInside)
        return thisButton
        
    }()
    
    lazy var backButton: UIButton = {
        let thisButton = UIButton().button(backgroundImage: UIImage(systemName:"chevron.backward"))
        thisButton.tintColor = .black
        thisButton.addTarget(self, action: #selector(pressBack), for: .touchUpInside)
        return thisButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(logOutButton)
        view.addSubview(backButton)
        logOutButton.anchorView(bottom:view.bottomAnchor,paddingBottom:.init(h:46),width: .init(w:158), height: .init(h:56))
        logOutButton.centerX(inView:view)
        backButton.anchorView(top:view.topAnchor,left:view.leftAnchor, paddingTop: .init(h:50),paddingLeft:.init(w:20),width:.init(h:100),height: .init(h: 50))
        
        let SettingsView = UIHostingController(rootView: SettingsView())
        addChild(SettingsView)
        view.addSubview(SettingsView.view)
        SettingsView.view.anchorView(top: backButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height:.init(h:UIdeviceSize.height * 0.5))
        SettingsView.didMove(toParent: self)
      
    }
    
    @objc func pressBack() {
        navigationController?.popToRootViewController(animated:true)
        
    }

    @objc func pressLogOut() {
       let sAVC = singleButtonAlert(tittle:AlertMessage.inProgress.messageTitle, subTitle: AlertMessage.inProgress.messageSubTitle, firstButtonTitle:AlertMessage.inProgress.firstButtonTitle, firstButtonBackGrounColor:.clear) {
            
        }
        sAVC.delegate = self
        self.present(sAVC, animated: true)
        
    }
}


