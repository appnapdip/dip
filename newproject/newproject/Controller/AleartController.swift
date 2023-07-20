//
//  AleartController.swift
//  newproject
//
//  Created by New User on 7/20/23.
//

import Foundation
import UIKit


class AleartViewController: ViewController  {
    
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
    
    
    lazy var CancelButton:UIButton = {
        let hexColor = UIColor(hex:"#2EA7FF")
        let image = UIImage(named:"arrow-right")
        var thisButton = UIButton().button(backgroundImage:image,backgroundColor:hexColor,cornerRadius:.init(h:68,for:68)/2,shadow:UIColor.blue.cgColor,shadowOpacity:0.5,shadowRadius:65)
        thisButton.tintColor = .white
        return thisButton
    }()
    
    // MARK: - creating skipButton
    lazy var RemoveButton:UIButton = {
        let hexColor = UIColor(hex:"#323336")
        var thisButton = UIButton().button(title:"Skip",titleColor:.black,font: UIFont(name:"Poppins-Regular", size: 16)!)
        return thisButton
        
    }()
    
    
    let ButtonSStackView:UIStackView = {
        let thisPinStackView = UIStackView()
        thisPinStackView.axis = NSLayoutConstraint.Axis.horizontal
        thisPinStackView.distribution = .fillEqually
        //thisPinStackView.alignment = .fill
        thisPinStackView.spacing = .init(w:18)
        thisPinStackView.backgroundColor = .green
        return thisPinStackView
    }()
    
    
    
    
    
    override func viewDidLoad() {
        loadUI()
       
    }
    
    private func loadUI() {
        
        view.addSubview(AleartView)
        view.addSubview(AleartTitle)
        view.addSubview(AleartSubTitle)
        view.addSubview(CancelButton)
        view.addSubview(RemoveButton)
        view.addSubview(ButtonSStackView)
        
        AleartView.anchorView(top:view.topAnchor,paddingTop: .init(h:355) , width:.init(w:334) , height:.init(h:187))
        AleartView.centerX(inView:view)
        
        AleartTitle.anchorView(top:view.topAnchor,paddingTop: .init(h:379) , width:.init(w:208) , height:.init(h:16))
        AleartTitle.centerX(inView:view)
        
        AleartSubTitle.anchorView(top:view.topAnchor,paddingTop: .init(h:403) , width:.init(w:266) , height:.init(h:35))
        AleartSubTitle.centerX(inView:view)
        
        ButtonSStackView.anchorView(bottom:view.bottomAnchor,paddingBottom:.init(h:-378), width: .init(w:278), height: .init(w:48))
        ButtonSStackView.centerX(inView:view)
                              
                              
        
        
    }
    
    
    
    
    
}




