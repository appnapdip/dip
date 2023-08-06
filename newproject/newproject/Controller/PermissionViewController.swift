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
    
    lazy var photoStack:UIStackView = {
        let thisStackView = UIStackView()
        thisStackView.axis = .horizontal
        thisStackView.distribution = .fillProportionally
        return thisStackView
     
    }()
    
    
   
    var photoTitle:UILabel = {
        let hexColor = UIColor(hex:"#000000")
        let thisLabel = UILabel().label(title:"Photo Usage", textColor:hexColor,lines:1,fontStyle:UIFont(name: "Poppins-Regular", size:16))
        return thisLabel
        
    }()
    
    
    
    
    var photoSubTitle:UILabel = {
        let hexColor = UIColor(hex:"#5A5F73")
        let thisLabel = UILabel().label(title:"permission to access the photo storage", textColor:hexColor,lines: 1 ,fontStyle:UIFont(name: "Poppins-Regular", size:8))
        return thisLabel
    }()
    

    lazy var photoButton:UIButton = {
        let thisButton = UIButton().button(title:"Allow", titleColor:.orange, cornerRadius: .init(w:4), borderColor:UIColor(hex:"#838BA7").cgColor, borderWidth:  .init(w:1))
        thisButton.backgroundColor = .clear
        thisButton.addTarget(self, action: #selector(pressFinish), for: .touchUpInside)
        return thisButton
    }()
    
    
    var photoImage:UIImageView = {
        let thisImage = UIImageView()
        thisImage.image = UIImage(named:"photos")
        return thisImage
        
    }()
    
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        
    }
    
    
    
    private func loadUI() {
        view.addSubview(permissionscrollView)
        view.addSubview(finishButton)
        view.addSubview(AccessView)
        AccessView.addSubview(photoStack)
     
       
        
        
        
        
        
        
        permissionscrollView.addSubview(permissionTitle)
        permissionscrollView.addSubview(permissionSubTitle)
        permissionscrollView.addSubview(permissionGroupImage)
        
        photoStack.addArrangedSubview(photoImage)
        photoStack.addArrangedSubview(photoTitle)
        photoStack.addArrangedSubview(photoSubTitle)
        photoStack.addArrangedSubview(photoButton)
        
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
        photoStack.anchorView(top: permissionGroupImage.bottomAnchor, left:view.leftAnchor, right:view.rightAnchor, paddingTop: .init(h:10), paddingLeft: .init(w:10), paddingRight:  .init(w:10), height: .init(h:50))
        
    }
    
    @objc func pressFinish() {
        navigationController?.popViewController(animated:true)
        
    }
    
}


