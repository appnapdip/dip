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
    
    
    lazy var crossButton:UIButton = {
        let thisButton = UIButton().button(backgroundImage:UIImage(systemName:"multiply"))
        thisButton.tintColor = .black
        return thisButton
        
    }()
    
    
    
    
    lazy var mainStackView:UIStackView = {
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
        view.addSubview(permissionscrollView)
        view.addSubview(finishButton)
        view.addSubview(crossButton)
        permissionscrollView.addSubview(mainStackView)
        permissionscrollView.delegate = self
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
        crossButton.anchorView(right:view.rightAnchor, width: .init(w:64), height: .init(h:64))
        crossButton.centerY(inView:permissionTitle)
        //        AccessView.anchorView(top:permissionGroupImage.bottomAnchor,left:permissionscrollView.leftAnchor,bottom:finishButton.topAnchor,    right:permissionscrollView.rightAnchor)
        mainStackView.anchorView(top:permissionGroupImage.bottomAnchor, left:permissionscrollView.leftAnchor, right: permissionscrollView.rightAnchor,paddingTop:.init(h:60),paddingLeft: .init(w:30), paddingRight: .init(w:30))
        
        
        for permission in permissions {
//            lazy var permissionsStackView:UIStackView = {
//                let thisstackView = UIStackView()
//                thisstackView.axis = .horizontal
//                thisstackView.distribution = .fill
//                thisstackView.spacing = 28
//                return thisstackView
//
//            }()
            
            
            let permissionsStackView = UIStackView()
            permissionsStackView.axis = .horizontal
            permissionsStackView.distribution = .fillProportionally
            permissionsStackView.spacing = .init(w:20)
            
            
            
            
            
//            lazy var childStackView:UIStackView = {
//                let childStackView = UIStackView()
//                childStackView.axis = .vertical
//                childStackView.distribution = .fill
//                return thisstackView
//
//            }()
            
            
            let childStackView = UIStackView()
            childStackView.axis = .vertical
            childStackView.distribution = .fillProportionally
            
            
//
//            lazy var permissionTitles:UILabel = {
//                let hexColor = UIColor(hex:"#000000")
//                let permissionTitles = UILabel().label(title:permission.title, textColor:hexColor,lines:1,fontStyle:UIFont(name: "Poppins-Regular", size:14),allignment:.left)
//                return thisLabel
//
//            }()
//
            let hexColor = UIColor(hex:"#000000")
            let permissionTitles = UILabel().label(title:permission.title, textColor:hexColor,lines:1,fontStyle:UIFont(name: "Poppins-Regular", size:20),allignment:.left)
            
            
            
            
//            lazy var permissionSubTitles:UILabel = {
//                let hexColor = UIColor(hex:"#5A5F73")
//                let thisLabel = UILabel().label(title:permission.subtitle, textColor:hexColor,lines: 1 ,fontStyle:UIFont(name: "Poppins-Regular", size:8),allignment:.left)
//                return thisLabel
//            }()
            
            
            
            let permissionSubTitles = UILabel().label(title:permission.subtitle, textColor:UIColor(hex:"#5A5F73"),lines: 1 ,fontStyle:UIFont(name: "Poppins-Regular", size:13),allignment:.left)
            
            
//
//            lazy var permissionImages:UIImageView = {
//                let thisImage = UIImageView().Image(contantMode:.scaleAspectFit)
//                thisImage.image = UIImage(named:permission.image)
//                return thisImage
//            }()
            
            
            let permissionImages = UIImageView().Image(contantMode:.scaleAspectFit)
            permissionImages.image = UIImage(named:permission.image)
            permissionImages.anchorView(width:.init(w:28), height:.init(h:28))
            
            
            
//
//            lazy var AllowButtons:UIButton = {
//                let thisButton = UIButton().button(title:"Allow", titleColor: .orange,backgroundColor:.clear,font:UIFont(name:"Poppins-Light", size:10)!, cornerRadius:.init(h:7), borderColor:UIColor(hex:"#838BA7").cgColor, borderWidth: .init(w:1))
//                return thisButton
//            }()
            
            let AllowButtons = UIButton().button(title:"Allow", titleColor: .orange,backgroundColor:.clear,font:UIFont(name:"Poppins-Light", size:10)!, cornerRadius:.init(h:7), borderColor:UIColor(hex:"#838BA7").cgColor, borderWidth: .init(w:1))
            AllowButtons.anchorView(width: .init(w:60) , height: .init(w:32))
            
            
            
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


