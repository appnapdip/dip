//
//  PermissionViewController.swift
//  newproject
//
//  Created by New User on 8/5/23.
//

import Foundation
import UIKit
import Photos

class PerMissionViewController:UIViewController, UIScrollViewDelegate,RemoveAleartView {
    func pressAction(firstButton: Bool) {
        self.firstButton = firstButton
    }
    
    var firstButton:Bool = false
    
    // MARK: - Properties
    
    // PermissionModel Array
    let permissions:[PermissionModel] = [PermissionModel(title:"Photo Usage", subtitle:"Permission to access the photo usage", image: "photos"),
                                         PermissionModel(title:"Location", subtitle:"Permission to access the device location", image:"signs"),
                                         PermissionModel(title:"Calender", subtitle:"Permission to access the caldender events", image:"calendar"),    PermissionModel(title:"Notification", subtitle:"Permission to access the user notification", image:"notification"),
                                         PermissionModel(title:"Motion & Fitness", subtitle:"Permission to access the motion data and fitness", image:"signs"),
    ]
    
    // permissionscrollView
    
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
    
    //  permissionTitle
    
    var permissionTitle:UILabel = {
        let hexColor = UIColor(hex:"#000000")
        let thisLabel = UILabel().label(title:"Permission", textColor:hexColor,lines:1,fontStyle:UIFont(name: "Poppins-Regular", size:28),allignment:.center)
        return thisLabel
        
    }()
    
    // permissionSubTitle
    
    var permissionSubTitle:UILabel = {
        let hexColor = UIColor(hex:"#5A5F73")
        let thisLabel = UILabel().label(title:"Widgethub Needs Your Permission to Fuction Properly.\nYou can change it anytime from Settings.", textColor:hexColor,lines: 2 ,fontStyle:UIFont(name: "Poppins-Regular", size:16),allignment:.center)
        return thisLabel
    }()
    
    // permissionGroupImage
    
    var permissionGroupImage:UIImageView = {
        let thisImage = UIImageView().Image(contantMode:.scaleAspectFit)
        thisImage.image = UIImage(named:"permissionGroupImage")
        return thisImage
        
    }()
    
    // finishButton
    lazy var finishButton:UIButton = {
        let thisButton = UIButton().button(title:"Finish", titleColor:UIColor(hex:"#FFFFFF"), cornerRadius: .init(w:16))
        thisButton.backgroundColor = .orange.withAlphaComponent(.init(h:1))
        thisButton.addTarget(self, action: #selector(pressFinish), for: .touchUpInside)
        return thisButton
    }()
    
    // crossButton
    
    lazy var crossButton:UIButton = {
        let thisButton = UIButton().button(backgroundImage:UIImage(systemName:"multiply"))
        thisButton.tintColor = .black
        return thisButton
        
    }()
    
    // shadowView
    let shadowView:UIView = {
        let thisShadowView = UIView()
        return thisShadowView
    }()
    
    // mainStackView
    
    let mainStackView:UIStackView = {
        let thisStackView = UIStackView()
        thisStackView.axis = .vertical
        thisStackView.spacing = .init(h:40)
        thisStackView.distribution = .fillEqually
        return thisStackView
        
    }()
    
    // viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        
        
    }
    
    // viewDidLayoutSubviews()
    
    override func viewDidLayoutSubviews() {
        showGradient()
    }
    
    // loadUI()
    
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
        
        
        
        ///finishButton
        view.addSubview(finishButton)
        finishButton.anchorView(bottom:view.bottomAnchor,paddingBottom:.init(h:68),width: .init(w:226), height: .init(h:48))
        finishButton.centerX(inView:view)
        
        ///crossButton
        view.addSubview(crossButton)
        crossButton.anchorView(top: view.topAnchor, right:view.rightAnchor, paddingTop: .init(h: 50), width: .init(w:64), height: .init(h:64))
        
        
        
        // Loops
        
        for i in 0..<permissions.count {
            
            // permissionsStackView
            let permissionsStackView = UIStackView()
            permissionsStackView.axis = .horizontal
            permissionsStackView.distribution = .fillProportionally
            permissionsStackView.spacing = .init(w:20)
            permissionsStackView.anchorView(height: .init(h:40))
            
            // childStackView
            
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
            
            
            let AllowButtons = UIButton().button(title:"Allow", titleColor:.orange,backgroundColor:.clear,font:UIFont(name:"Poppins-Light", size:13)!, cornerRadius:.init(h:7), borderColor:UIColor(hex:"#838BA7").cgColor, borderWidth: .init(w:1))
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
    
    // pressFinish()
    
    @objc func pressFinish() {
        navigationController?.popViewController(animated:true)
        
    }
    
    // pressForPermission
    
    @objc func pressForPermission(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            getPermissionOfPhoto(sender:sender)
            
        case 1:
            sender.setImage(UIImage(systemName:"checkmark"), for:.normal)
            sender.tintColor = UIColor(hex:"#FFFFFF")
            sender.setTitleColor(.clear, for:.normal)
            sender.imageEdgeInsets = .init(top:0, left:16, bottom: 0, right: 0)
            sender.backgroundColor = .orange
            sender.layer.borderWidth = 0
            
            
        case 2:
            sender.setImage(UIImage(systemName:"checkmark"), for:.normal)
            sender.tintColor = UIColor(hex:"#FFFFFF")
            sender.setTitleColor(.clear, for:.normal)
            sender.imageEdgeInsets = .init(top:0, left:16, bottom: 0, right: 0)
            sender.backgroundColor = .orange
            sender.layer.borderWidth = 0
            
        case 3:
            sender.setImage(UIImage(systemName:"checkmark"), for:.normal)
            sender.tintColor = UIColor(hex:"#FFFFFF")
            sender.setTitleColor(.clear, for:.normal)
            sender.imageEdgeInsets = .init(top:0, left:16, bottom: 0, right: 0)
            sender.backgroundColor = .orange
            sender.layer.borderWidth = 0
            
            
        default:
            sender.setImage(UIImage(systemName:"checkmark"), for:.normal)
            sender.tintColor = UIColor(hex:"#FFFFFF")
            sender.setTitleColor(.clear, for:.normal)
            
        }
        
        // create func to getPermissionOfPhoto() of photo from photoLibrary
        
        func getPermissionOfPhoto(sender:UIButton) {
            
            switch PHPhotoLibrary.authorizationStatus(for: .readWrite) {
                
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization { status in
                    DispatchQueue.main.async {
                        if status == .authorized {
                            sender.setImage(UIImage(systemName:"checkmark"), for:.normal)
                            sender.tintColor = UIColor(hex:"#FFFFFF")
                            sender.setTitleColor(.clear, for:.normal)
                            sender.imageEdgeInsets = .init(top:0, left:16, bottom: 0, right: 0)
                            sender.backgroundColor = .orange
                            sender.layer.borderWidth = 0
                        }
                    }
                }
                
                
            case .restricted:
                let restricted = doubleButtonAleart(tittle:AlertMessage.restricted.messageTitle, subTitle: AlertMessage.restricted.messageSubTitle, firstButtonTitle: AlertMessage.restricted.firstButtonTitle, firstButtonBackGrounColor:.clear, secondButtonTitle: AlertMessage.restricted.secondButtonTitle, secondButtonBackGroundColor:.red) {
                    gotoSettings()
                    
                }
                
                restricted.delegate = self
                self.present(restricted, animated: true)
                
            case .denied:
                let denied = doubleButtonAleart(tittle:AlertMessage.denied.messageTitle, subTitle: AlertMessage.denied.messageSubTitle, firstButtonTitle: AlertMessage.denied.firstButtonTitle, firstButtonBackGrounColor:.clear, secondButtonTitle: AlertMessage.denied.secondButtonTitle, secondButtonBackGroundColor:.red) {
                    gotoSettings()
                    
                }
                
                denied.delegate = self
                self.present(denied, animated: true)
                
            case .authorized:
                
                let authrized = doubleButtonAleart(tittle:AlertMessage.authorized.messageTitle, subTitle:AlertMessage.authorized.messageSubTitle, firstButtonTitle:AlertMessage.authorized.firstButtonTitle, firstButtonBackGrounColor:.clear, secondButtonTitle:AlertMessage.authorized.secondButtonTitle, secondButtonBackGroundColor: .red) {
                    gotoSettings()
                }
                authrized.delegate = self
                self.present(authrized, animated:true)
                
                
            case .limited:
                let limited = doubleButtonAleart(tittle:AlertMessage.limited.messageTitle, subTitle:AlertMessage.limited.messageSubTitle, firstButtonTitle:AlertMessage.limited.firstButtonTitle, firstButtonBackGrounColor:.clear, secondButtonTitle:AlertMessage.limited.secondButtonTitle, secondButtonBackGroundColor:.red) {
                    gotoSettings()
                }
                
                limited.delegate = self
                self.present(limited, animated:true)
                
            @unknown default:
                print("default")
            }
            
            
        }
        
        
        // create function for gotoSettings()
        func gotoSettings() {
            if let url = URL(string:UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
    }
}


// create func for gotoSettings


