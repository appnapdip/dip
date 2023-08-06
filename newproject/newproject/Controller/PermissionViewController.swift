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
    
    let permissions:[PermissionModel] = [PermissionModel(title:"Photo Usage", subtitle:"Permission to access the photo usage", image: "photos"), PermissionModel(title:"Storage Usage", subtitle:"Permission to access the storage usage", image:"server"),
                                         PermissionModel(title:"Location", subtitle:"Permission to access the device location", image:"signs")]
    
    
    
    
    
    
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
    
    
    
    lazy var AccessView:UIView = {
        let thisView = UIView()
        return thisView
    }()
    
    lazy var mainStackView:UIStackView = {
        let thisStackView = UIStackView()
        thisStackView.axis = .vertical
        thisStackView.spacing = 42
        thisStackView.distribution = .fill
        
        return thisStackView
        
    }()
    
override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        
    }
    
    
    
    private func loadUI() {
        view.addSubview(permissionscrollView)
        view.addSubview(finishButton)
        view.addSubview(mainStackView)
        //AccessView.addSubview(mainStackView)
        permissionscrollView.addSubview(permissionTitle)
        permissionscrollView.addSubview(permissionSubTitle)
        permissionscrollView.addSubview(permissionGroupImage)
        permissionscrollView.anchorView(top:view.topAnchor,left:view.leftAnchor,bottom: view.bottomAnchor,right:view.rightAnchor)
        permissionTitle.anchorView(top: view.topAnchor,paddingTop:.init(h:66),width:.init(w:152),height: .init(h:46))
        permissionTitle.centerX(inView:permissionscrollView)
        permissionSubTitle.anchorView(top:permissionTitle.bottomAnchor,paddingTop:.init(h:8),width: .init(w:332),height: .init(h:40))
        permissionSubTitle.centerX(inView:permissionscrollView)
        permissionGroupImage.anchorView(top:permissionSubTitle.bottomAnchor,paddingTop: .init(h:33),width: .init(w:330), height: .init(h:240))
        permissionGroupImage.centerX(inView:permissionscrollView)
        finishButton.anchorView(bottom:view.bottomAnchor,paddingBottom:.init(h:68),width: .init(w:226), height: .init(h:48))
        finishButton.centerX(inView:view)
//        AccessView.anchorView(top:permissionGroupImage.bottomAnchor,left:permissionscrollView.leftAnchor,bottom:finishButton.topAnchor,    right:permissionscrollView.rightAnchor)
        mainStackView.anchorView(top:permissionGroupImage.bottomAnchor, left:view.leftAnchor, right: permissionscrollView.rightAnchor,paddingTop:.init(h:60))
        
    for permission in permissions {
            lazy var permissionsStackView:UIStackView = {
                let thisstackView = UIStackView()
                thisstackView.axis = .horizontal
                thisstackView.distribution = .fill
                thisstackView.spacing = 28
                return thisstackView
                
            }()
            
            
            lazy var childStackView:UIStackView = {
                let thisstackView = UIStackView()
                thisstackView.axis = .vertical
                thisstackView.distribution = .fill
                return thisstackView
                
            }()
            
            
            
            lazy var permissionTitles:UILabel = {
                let hexColor = UIColor(hex:"#000000")
                let thisLabel = UILabel().label(title:permission.title, textColor:hexColor,lines:1,fontStyle:UIFont(name: "Poppins-Regular", size:14),allignment:.left)
                return thisLabel
                
            }()
            
            
            
            lazy var permissionSubTitles:UILabel = {
                let hexColor = UIColor(hex:"#5A5F73")
                let thisLabel = UILabel().label(title:permission.subtitle, textColor:hexColor,lines: 1 ,fontStyle:UIFont(name: "Poppins-Regular", size:8),allignment:.left)
                return thisLabel
            }()
            
            
            lazy var permissionImages:UIImageView = {
                let thisImage = UIImageView().Image(contantMode:.scaleAspectFit)
                thisImage.image = UIImage(named:permission.image)
                return thisImage
            }()
            
            
            
            lazy var AllowButtons:UIButton = {
                let thisButton = UIButton().button(title:"Allow", titleColor:.orange, cornerRadius: .init(w:16))
                thisButton.backgroundColor = .white
                thisButton.addTarget(self, action: #selector(pressFinish), for: .touchUpInside)
                return thisButton
            }()
            
            
            
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
    
}


