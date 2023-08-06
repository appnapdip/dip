//
//  PermissionViewController.swift
//  newproject
//
//  Created by New User on 8/5/23.
//

import Foundation
import UIKit

class PerMissionViewController:UIViewController {
    
    
    // MARK: - Properties
    
    
    lazy var permissionscrollView: UIScrollView = {
        let thisScrollView = UIScrollView()
        thisScrollView.isScrollEnabled = true
        view.backgroundColor = .white
        return thisScrollView
    }()
    
    
    
    var permissionTitle:UILabel = {
        let hexColor = UIColor(hex:"#000000")
        let thisLabel = UILabel().label(title:"Permission", textColor:hexColor,lines:1,fontStyle:UIFont(name: "Poppins-Regular", size:28),allignment:.center)
        return thisLabel
        
    }()
    
    
    var permissionSubTitle:UILabel = {
        let hexColor = UIColor(hex:"#5A5F73")
        let thisLabel = UILabel().label(title:"Widgethub Needs Your Permission to Fuction Properly.\nYou can change it anytime from Settings.", textColor:hexColor,lines: 2 ,fontStyle:UIFont(name: "Poppins-Regular", size:16),allignment:.center)
        return thisLabel
    }()
    
    
    var permissionGroupImage:UIImageView = {
        let thisImage = UIImageView()
        thisImage.image = UIImage(named:"permissionGroupImage")
        return thisImage
        
    }()
    
    
    lazy var finishButton:UIButton = {
        let thisButton = UIButton().button(title:"Finish", titleColor:UIColor(hex:"#FFFFFF"), cornerRadius: .init(w:16))
        thisButton.backgroundColor = .orange.withAlphaComponent(.init(h:1))
        thisButton.addTarget(self, action: #selector(pressFinish), for: .touchUpInside)
        return thisButton
    }()
    
    
    
    lazy var AccessView:UIView = {
        let thisView = UIView()
        thisView.backgroundColor = .clear
        return thisView
    }()
    
    
    lazy var PermissionForAccessStack:UIStackView = {
        let thisStackView = UIStackView()
        thisStackView.axis = .vertical
        thisStackView.distribution = .fill
        return thisStackView
        
    }()
    
    
    lazy var PhotoAccessImage:UIImageView = {
    let thisImage = UIImageView()
        thisImage.image = UIImage(named:"photos")
        return thisImage
        
    }()
    
    
    lazy var serverAccessImage:UIImageView = {
    let thisImage = UIImageView()
        thisImage.image = UIImage(named:"server")
        return thisImage
        
    }()
    
    
    
    lazy var signsAccessImage:UIImageView = {
    let thisImage = UIImageView()
        thisImage.image = UIImage(named:"signs")
        return thisImage
        
    }()
    
    
    
    var photousageTitle:UILabel = {
        let hexColor = UIColor(hex:"#000000")
        let thisLabel = UILabel().label(title:"Photo Usage", textColor:hexColor,lines:1,fontStyle:UIFont(name: "Poppins-Regular", size:28),allignment:.center)
        return thisLabel
        
    }()
    
    
    
    var storageusageTitle:UILabel = {
        let hexColor = UIColor(hex:"#000000")
        let thisLabel = UILabel().label(title:"Storage Usage", textColor:hexColor,lines:1,fontStyle:UIFont(name: "Poppins-Regular", size:28),allignment:.center)
        return thisLabel
        
    }()
    
    
    
    
    var locationTitle:UILabel = {
        let hexColor = UIColor(hex:"#000000")
        let thisLabel = UILabel().label(title:"Location", textColor:hexColor,lines:1,fontStyle:UIFont(name: "Poppins-Regular", size:28),allignment:.center)
        return thisLabel
        
    }()
    
    
    var photousageSubTitle:UILabel = {
        let hexColor = UIColor(hex:"#5A5F73")
        let thisLabel = UILabel().label(title:"Permission to access the photo usage", textColor:hexColor,lines: 2 ,fontStyle:UIFont(name: "Poppins-Regular", size:16),allignment:.center)
        return thisLabel
    }()
    
    
    var storageusageSubTitle:UILabel = {
        let hexColor = UIColor(hex:"#5A5F73")
        let thisLabel = UILabel().label(title:"permission to access the storage usage ", textColor:hexColor,lines: 2 ,fontStyle:UIFont(name: "Poppins-Regular", size:16),allignment:.center)
        return thisLabel
    }()
    
    
    
    var locationSubTitle:UILabel = {
        let hexColor = UIColor(hex:"#5A5F73")
        let thisLabel = UILabel().label(title:"permission to acces the device location", textColor:hexColor,lines: 2 ,fontStyle:UIFont(name: "Poppins-Regular", size:16),allignment:.center)
        return thisLabel
    }()
    
    
    
    
    
    lazy var photousageButton:UIButton = {
        let thisButton = UIButton().button(title:"Allow", titleColor:.orange, cornerRadius: .init(w:16))
        thisButton.backgroundColor = .clear
        thisButton.addTarget(self, action: #selector(pressFinish), for: .touchUpInside)
        return thisButton
    }()
    
    
    
    
    lazy var storageusageButton:UIButton = {
        let thisButton = UIButton().button(title:"Allow", titleColor:UIColor(hex:"#FFFFFF"), cornerRadius: .init(w:16))
        thisButton.backgroundColor = .clear
        thisButton.addTarget(self, action: #selector(pressFinish), for: .touchUpInside)
        return thisButton
    }()
    
    
    
    
    lazy var locationButton:UIButton = {
        let thisButton = UIButton().button(title:"Allow", titleColor:.orange, cornerRadius: .init(w:16))
        thisButton.backgroundColor = .clear
        thisButton.addTarget(self, action: #selector(pressFinish), for: .touchUpInside)
        return thisButton
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        
    }
    
    
    
    private func loadUI() {
        view.addSubview(permissionscrollView)
        view.addSubview(finishButton)
        view.addSubview(AccessView)
        AccessView.addSubview(PermissionForAccessStack)
        PermissionForAccessStack.addArrangedSubview(PhotoAccessImage)
        PermissionForAccessStack.addArrangedSubview(serverAccessImage)
        PermissionForAccessStack.addArrangedSubview(signsAccessImage)
        PermissionForAccessStack.addArrangedSubview(photousageTitle)
        PermissionForAccessStack.addArrangedSubview(storageusageTitle)
        PermissionForAccessStack.addArrangedSubview(locationTitle)
        PermissionForAccessStack.addArrangedSubview(photousageSubTitle)
        PermissionForAccessStack.addArrangedSubview(storageusageSubTitle)
        PermissionForAccessStack.addArrangedSubview(locationSubTitle)
        PermissionForAccessStack.addArrangedSubview(photousageButton)
        PermissionForAccessStack.addArrangedSubview(storageusageButton)
        PermissionForAccessStack.addArrangedSubview(locationButton)
        
        
        
        
        
        
        
        permissionscrollView.addSubview(permissionTitle)
        permissionscrollView.addSubview(permissionSubTitle)
        permissionscrollView.addSubview(permissionGroupImage)
        permissionscrollView.anchorView(top:view.topAnchor,left:view.leftAnchor,bottom: view.bottomAnchor,right:view.rightAnchor)
        permissionTitle.anchorView(top: permissionscrollView.topAnchor,paddingTop:.init(h:66),width:.init(w:173))
        permissionTitle.centerX(inView:permissionscrollView)
        permissionSubTitle.anchorView(top:permissionTitle.bottomAnchor,paddingTop:.init(h:12),width: .init(w:350))
        permissionSubTitle.centerX(inView:permissionscrollView)
        permissionGroupImage.anchorView(top:permissionSubTitle.bottomAnchor,paddingTop: .init(h:12),width: .init(w:350))
        permissionGroupImage.centerX(inView:permissionscrollView)
        finishButton.anchorView(bottom:view.bottomAnchor,paddingBottom:.init(h:46),width: .init(w:200), height: .init(h:56))
        finishButton.centerX(inView:view)
        AccessView.anchorView(top:permissionGroupImage.bottomAnchor,left:permissionscrollView.leftAnchor,bottom:finishButton.topAnchor,    right:permissionscrollView.rightAnchor)
        PermissionForAccessStack.anchorView(top:permissionGroupImage.bottomAnchor, left:permissionscrollView.leftAnchor,bottom:finishButton.topAnchor, right:AccessView.rightAnchor, paddingTop:.init(h:10),paddingLeft: .init(w:10), paddingBottom: .init(h:10), paddingRight: .init(w:10))
        
        
        
        
    }
    
    @objc func pressFinish() {
        navigationController?.popViewController(animated:true)
        
    }
    
}


