//
//  AleartController.swift
//  newproject
//
//  Created by New User on 7/20/23.
//

import Foundation
import UIKit


class AleartViewController: ViewController  {
    
    // MARK: - PROPERTIES
    
    var AleartTitle:UILabel = {
        let hexColor = UIColor(hex:"#323336")
        let thisLabel = UILabel().label(title:"Remove Album Password", textColor:hexColor,fontStyle:UIFont(name: "Poppins-SemiBold", size:16),allignment:.center)
        return thisLabel
        
    }()
    
    var  AleartSubTitle:UILabel = {
        let hexColor = UIColor(hex:"#5A5F73")
        let thisLabel = UILabel().label(title:"This album will no longer required any password to be viewed", textColor:hexColor,fontStyle:UIFont(name: "Poppins-Regular", size:14),allignment:.center)
        return thisLabel
    }()
    
    
    var AleartView: UIView = {
        let thisView = UIView()
        thisView.backgroundColor = .white
        thisView.layer.cornerRadius = 16
        return thisView
    }()
    
    // MARK: - create Cancel Button
    
    lazy var CancelButton:UIButton = {
        let hexColor = UIColor(hex:"#5A5F73")
        var thisButton = UIButton().button(title:"Cancel",titleColor:hexColor,font:UIFont(name:"Poppins-Medium", size:16)!,cornerRadius:.init(w:12))
        thisButton.layer.borderColor = UIColor(hex:"#323336").cgColor
        thisButton.layer.borderWidth = .init(h:1)
        return thisButton
    }()
    
    
    lazy var RemoveButton:UIButton = {
        let hexColor = UIColor(hex:"#FFFFFF")
        var thisButton = UIButton().button(title:"Remove",titleColor:hexColor,backgroundColor: UIColor(hex: "#FF4D4D"),font:UIFont(name:"Poppins-Medium", size:16)!,cornerRadius:.init(w:12))
        return thisButton
        
    }()
    
    
    let ButtonSStackView:UIStackView = {
        let ButtonSStackView = UIStackView()
        ButtonSStackView.axis = NSLayoutConstraint.Axis.horizontal
        ButtonSStackView.distribution = .fillEqually
        //thisPinStackView.alignment = .fill
        ButtonSStackView.spacing = .init(w:18)
        return ButtonSStackView
    }()
    
    
    
    
    // MARK: - ViewDidLoad Fuction
    override func viewDidLoad() {
        loadUI()
        
    }
    
    // MARK: - LoadUI Fuction
    
    private func loadUI() {
        
        view.addSubview(AleartView)
        AleartView.addSubview(AleartTitle)
        AleartView.addSubview(AleartSubTitle)
        AleartView.addSubview(ButtonSStackView)
        ButtonSStackView.addArrangedSubview(CancelButton)
        ButtonSStackView.addArrangedSubview(RemoveButton)
        
        AleartView.anchorView(top:view.topAnchor,paddingTop: .init(h:355) , width:.init(w:334) , height:.init(h:187))
        AleartView.centerX(inView:view)
        
        AleartTitle.anchorView(top:AleartView.topAnchor,paddingTop: .init(h:20) , width:.init(w:208) , height:.init(h:16))
        AleartTitle.centerX(inView:view)
        
        AleartSubTitle.anchorView(top:AleartTitle.bottomAnchor,paddingTop: .init(h:10), width:.init(w:266), height:.init(h:35))
        AleartSubTitle.centerX(inView:view)
        
        ButtonSStackView.anchorView(top:AleartSubTitle.bottomAnchor,paddingTop:.init(h:20),width:.init(w:278) , height:.init(h:48))
        ButtonSStackView.centerX(inView:view)
        
    }
    
}




