//
//  SettingsViewController.swift
//  newproject
//
//  Created by New User on 8/1/23.
//

import Foundation
import UIKit
import SwiftUI


class SettingsViewController:UIViewController , RemoveAleartView {
    // MARK: - Protocol Function
    func pressAction(firstButton: Bool) {
        self.firstButton = firstButton
    }
    var firstButton: Bool = true
    
    // MARK: - logOutButton
    lazy var logOutButton:UIButton = {
        let thisButton = UIButton().button(title:"Log Out" , titleColor:UIColor(hex:"#FFFFFF"),backgroundColor:UIColor(hex:"#FF4D4D"),font: UIFont(name:"Poppins-SemiBold", size:.init(h:16))!,cornerRadius:
                .init(h:16))
        thisButton.addTarget(self, action: #selector(pressLogOutAction), for: .touchUpInside)
        return thisButton
        
    }()
    
    // MARK: - backButton
    lazy var backButton: UIButton = {
        let thisButton = UIButton().button(backgroundImage: UIImage(systemName:"chevron.backward"))
        thisButton.tintColor = .black
        thisButton.addTarget(self, action: #selector(pressBackAction), for: .touchUpInside)
        return thisButton
    }()
    
    // MARK: - permissionButton
    lazy var permissionButton: UIButton = {
        let thisButton = UIButton().button(backgroundImage:UIImage(named:"images"))
        thisButton.tintColor = UIColor(hex:"#838BA7")
        //thisButton.backgroundColor = .red
        thisButton.addTarget(self, action: #selector(pressOnPermission), for: .touchUpInside)
        return thisButton
    }()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsLoadUI()
    }
    
    // MARK: - settingsLoadUI()
    
    private func settingsLoadUI() {
        view.backgroundColor = .white
        /// logOutButton
        view.addSubview(logOutButton)
        logOutButton.anchorView(bottom:view.bottomAnchor,paddingBottom:.init(h:46),width: .init(w:158), height: .init(h:56))
        logOutButton.centerX(inView:view)
        ///backButton
        view.addSubview(backButton)
        backButton.anchorView(top:view.topAnchor,left:view.leftAnchor, paddingTop: .init(h:50),width:.init(h:38),height: .init(h:38))
        /// permissionButton
        view.addSubview(permissionButton)
        permissionButton.anchorView(top:view.topAnchor,right:view.rightAnchor, paddingTop: .init(h:50),width:.init(h:38),height: .init(h:38))
        
        // MARK: - Added SwiftUIView In SettingsViewController
        let SettingsView = UIHostingController(rootView: SettingsView())
        addChild(SettingsView)
        view.addSubview(SettingsView.view)
        SettingsView.view.anchorView(top: backButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height:.init(h:UIdeviceSize.height * 0.5))
        SettingsView.didMove(toParent: self)
        
    }
    
    // MARK: - pressBackAction()
    @objc func pressBackAction() {
        navigationController?.popToRootViewController(animated:true)
        
    }
    
    // MARK: - pressLogOutAction()
    
    @objc func pressLogOutAction() {
        let sAVC = singleButtonAlert(tittle:AlertMessage.inProgress.messageTitle, subTitle: AlertMessage.inProgress.messageSubTitle, firstButtonTitle:AlertMessage.inProgress.firstButtonTitle, firstButtonBackGrounColor:.clear) {
        }
        sAVC.delegate = self
        self.present(sAVC, animated: true)
        
    }
    
    // MARK: - pressOnPermission()
    
    @objc func pressOnPermission() {
        let svc = PerMissionViewController()
        navigationController?.pushViewController(svc, animated:true)
        
    }
}


