//
//  PermissionViewController.swift
//  newproject
//
//  Created by New User on 8/5/23.
//

import Foundation
import UIKit

class PerMissionViewController:UIViewController, UIScrollViewDelegate {
    
    
    // MARK: - Properties
    
    let permissions:[PermissionModel] = [PermissionModel(title:"Photo Usage", subtitle:"Permission to access the photo usage", image: "photos"),
                                         PermissionModel(title:"Location", subtitle:"Permission to access the device location", image:"signs"),
                                         PermissionModel(title:"Calender", subtitle:"Permission to access the caldender events", image:"calendar"),    PermissionModel(title:"Notification", subtitle:"Permission to access the user notification", image:"notification"),
                                         PermissionModel(title:"Motion & Fitness", subtitle:"Permission to access the motion data and fitness", image:"signs"),
    ]
    
    lazy var permissionscrollView: UIScrollView = {
        let thisScrollView = UIScrollView()
        thisScrollView.showsVerticalScrollIndicator = false
        //        thisScrollView.isDirectionalLockEnabled = true
        thisScrollView.showsHorizontalScrollIndicator = false
        thisScrollView.contentSize.height = .init(h:950)
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
        let thisImage = UIImageView().Image(contantMode:.scaleAspectFit)
        thisImage.image = UIImage(named:"permissionGroupImage")
        return thisImage
        
    }()
    
    
    lazy var finishButton:UIButton = {
        let thisButton = UIButton().button(title:"Finish", titleColor:UIColor(hex:"#FFFFFF"), cornerRadius: .init(w:16))
        thisButton.backgroundColor = .orange.withAlphaComponent(.init(h:1))
        thisButton.addTarget(self, action: #selector(pressFinish), for: .touchUpInside)
        return thisButton
    }()
    
    
    lazy var crossButton:UIButton = {
        let thisButton = UIButton().button(backgroundImage:UIImage(systemName:"multiply"))
        thisButton.tintColor = .black
        return thisButton
        
    }()
    
    
    let shadowView:UIView = {
        let thisShadowView = UIView()
        thisShadowView.backgroundColor = UIColor(hex:"#FFFFFF")
        return thisShadowView
    }()
    
    let mainStackView:UIStackView = {
        let thisStackView = UIStackView()
        thisStackView.axis = .vertical
        thisStackView.spacing = .init(h:40)
        thisStackView.distribution = .fillEqually
        return thisStackView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        
    }
    
    private func loadUI() {
        
        ///scrollview
        view.addSubview(permissionscrollView)
        permissionscrollView.delegate = self
        permissionscrollView.anchorView(top:view.topAnchor,left:view.leftAnchor,bottom: view.bottomAnchor,right:view.rightAnchor)
        
        ///permissionTitle
        permissionscrollView.addSubview(permissionTitle)
        permissionTitle.anchorView(top: permissionscrollView.topAnchor, paddingTop:.init(h:0),width:.init(w:152),height: .init(h:46))
        permissionTitle.centerX(inView:view)
        
        ///permissionSubTitle
        permissionscrollView.addSubview(permissionSubTitle)
        permissionSubTitle.anchorView(top:permissionTitle.bottomAnchor,paddingTop:.init(h:8),width: .init(w:332),height: .init(h:40))
        permissionSubTitle.centerX(inView:view)
        
        ///permissionGroupImage
        permissionscrollView.addSubview(permissionGroupImage)
        permissionGroupImage.anchorView(top:permissionSubTitle.bottomAnchor,paddingTop: .init(h:33),width: .init(w:330), height: .init(h:240))
        permissionGroupImage.centerX(inView:view)
        
        ///mainStackView
        permissionscrollView.addSubview(mainStackView)
        mainStackView.anchorView(top:permissionGroupImage.bottomAnchor, left:view.leftAnchor, right: view.rightAnchor,paddingTop:.init(h:60),paddingLeft: .init(w:30), paddingRight: .init(w:30))
        
        ///shadowview
        view.addSubview(shadowView)
        shadowView.anchorView(left:view.leftAnchor, bottom:view.bottomAnchor, right:view.rightAnchor,height: .init(h:140))
        shadowView.centerX(inView:view)
        
        ///finishButton
        view.addSubview(finishButton)
        finishButton.anchorView(bottom:view.bottomAnchor,paddingBottom:.init(h:68),width: .init(w:226), height: .init(h:48))
        finishButton.centerX(inView:view)
        
        ///crossButton
        view.addSubview(crossButton)
        crossButton.anchorView(top: view.topAnchor, right:view.rightAnchor, paddingTop: .init(h: 50), width: .init(w:64), height: .init(h:64))
        
        for i in 0..<permissions.count {
            
            let permissionsStackView = UIStackView()
            permissionsStackView.axis = .horizontal
            permissionsStackView.distribution = .fillProportionally
            permissionsStackView.spacing = .init(w:20)
            permissionsStackView.anchorView(height: .init(h:40))
            
            let childStackView = UIStackView()
            childStackView.axis = .vertical
            childStackView.distribution = .fillProportionally
            childStackView.spacing = .init(h:4)
            
            let hexColor = UIColor(hex:"#000000")
            let permissionTitles = UILabel().label(title:permissions[i].title, textColor:hexColor,lines:1,fontStyle:UIFont(name: "Poppins-Regular", size:20),allignment:.left)
            
            let permissionSubTitles = UILabel().label(title:permissions[i].subtitle, textColor:UIColor(hex:"#5A5F73"),lines: 1 ,fontStyle:UIFont(name: "Poppins-Medium", size:13),allignment:.left)
            
            let permissionImages = UIImageView().Image(contantMode:.scaleAspectFit)
            permissionImages.image = UIImage(named:permissions[i].image)
            permissionImages.anchorView(width:.init(w:28), height:.init(h:28))
            
            
            let AllowButtons = UIButton().button(title:"Allow", titleColor:UIColor(hex:"#FFFFFF"),backgroundColor:.orange,font:UIFont(name:"Poppins-Light", size:13)!, cornerRadius:.init(h:7), borderColor:UIColor(hex:"#838BA7").cgColor, borderWidth: .init(w:1))
            AllowButtons.anchorView(width: .init(w:60), height: .init(h:32))
            AllowButtons.tag = i
            AllowButtons.addTarget(self, action: #selector(pressForPermission(_:)), for:.touchUpInside)
            
            
            
            permissionsStackView.addArrangedSubview(permissionImages)
            permissionsStackView.addArrangedSubview(childStackView)
            childStackView.addArrangedSubview(permissionTitles)
            childStackView.addArrangedSubview(permissionSubTitles)
            permissionsStackView.addArrangedSubview(AllowButtons)
            mainStackView.addArrangedSubview(permissionsStackView)
            
            
        }// end of the foor loop
        
        
    }
    
    @objc func pressFinish() {
        navigationController?.popViewController(animated:true)
        
    }
    
    
    
    @objc func pressForPermission(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            let config = UIImage.SymbolConfiguration(
                pointSize:2, weight:.medium, scale:.small)
            let image = UIImage(systemName: "checkmark", withConfiguration: config)
            sender.setBackgroundImage(image, for:.normal)
            sender.tintColor = UIColor(hex:"#FFFFFF")
            sender.setTitleColor(.clear, for:.normal)
            
        case 1:
            sender.setBackgroundImage(UIImage(systemName:"checkmark"), for:.normal)
            sender.tintColor = UIColor(hex:"#FFFFFF")
            sender.setTitleColor(.clear, for:.normal)
            
        case 2:
            sender.setBackgroundImage(UIImage(systemName:"checkmark"), for:.normal)
            sender.tintColor = UIColor(hex:"#FFFFFF")
            sender.setTitleColor(.clear, for:.normal)
            
        case 3:
            sender.setBackgroundImage(UIImage(systemName:"checkmark"), for:.normal)
            sender.tintColor = UIColor(hex:"#FFFFFF")
            sender.setTitleColor(.clear, for:.normal)
            
            
        default:
            sender.setBackgroundImage(UIImage(systemName:"checkmark"), for:.normal)
            sender.tintColor = UIColor(hex:"#FFFFFF")
            sender.setTitleColor(.clear, for:.normal)
            
        }
        
        
    }
    
}


