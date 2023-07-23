//
//  AleartController.swift
//  newproject
//
//  Created by New User on 7/20/23.
//

import Foundation
import UIKit

protocol AleartRemove {
    func pressAction(firstButton: Bool)
}

class AleartViewController: ViewController  {
    // MARK: - PROPERTIES
    var buttonAction: (()->Void)? = nil
    
    var AleartTitle:UILabel = {
        let hexColor = UIColor(hex:"#323336")
        let thisLabel = UILabel().label(title:"Remove Album Password", textColor:hexColor,fontStyle:UIFont(name: "Poppins-SemiBold", size: .init(w:16)),allignment:.center)
        return thisLabel
        
    }()
    
    var  AleartSubTitle:UILabel = {
        let hexColor = UIColor(hex:"#5A5F73")
        let thisLabel = UILabel().label(title:"This album will no longer required any password to be viewed", textColor:hexColor,fontStyle:UIFont(name: "Poppins-Regular", size: .init(w:14)),allignment:.center)
        return thisLabel
    }()
    
    
    var AleartView: UIView = {
        let thisView = UIView()
        thisView.backgroundColor = .white
        thisView.layer.cornerRadius = .init(h:16)
        return thisView
    }()
    
    // MARK: - create Cancel Button
    
    lazy var CancelButton:UIButton = {
        let hexColor = UIColor(hex:"#5A5F73")
        var thisButton = UIButton().button(title:"Cancel",titleColor:hexColor,font:UIFont(name:"Poppins-Medium", size: .init(h:16))!,cornerRadius:.init(w:12))
        thisButton.layer.borderColor = UIColor(hex:"#323336").cgColor
        thisButton.layer.borderWidth = .init(h:1)
        thisButton.addTarget(self, action:#selector(cancel), for: .touchUpInside)
        return thisButton
    }()
    
    // MARK: - create Remove Button
    
    lazy var RemoveButton:UIButton = {
        let hexColor = UIColor(hex:"#FFFFFF")
        var thisButton = UIButton().button(title:"Remove",titleColor:hexColor,backgroundColor: UIColor(hex: "#FF4D4D"),font:UIFont(name:"Poppins-Medium", size:.init(h:16))!,cornerRadius:.init(w:12))
        thisButton.addTarget(self, action:#selector(remove), for: .touchUpInside)
        return thisButton
        
    }()
    
    
    let ButtonSStackView:UIStackView = {
        let ButtonSStackView = UIStackView()
        ButtonSStackView.axis = NSLayoutConstraint.Axis.horizontal
        ButtonSStackView.distribution = .fillEqually
        //thisPinStackView.alignment = .fill
        ButtonSStackView.spacing = UIdeviceSize.width * 0.04
        return ButtonSStackView
    }()
    
    var delegate:AleartRemove?
    var showSingleButton:Bool = true
    
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
        AleartView.centerY(inView: view)
        
        ButtonSStackView.addArrangedSubview(CancelButton)
        if !showSingleButton {ButtonSStackView.addArrangedSubview(RemoveButton)}
        
        AleartView.anchorView(width:UIdeviceSize.width * 0.80 , height:UIdeviceSize.height * 0.20 )
        AleartView.centerX(inView:view)
        
        AleartTitle.anchorView(top:AleartView.topAnchor,left:AleartView.leftAnchor ,right:AleartView.rightAnchor, paddingTop: .init(h:20), paddingLeft:.init(w:20), paddingRight:.init(w:20))
        AleartSubTitle.anchorView(top:AleartTitle.bottomAnchor,left:AleartView.leftAnchor ,right:AleartView.rightAnchor, paddingLeft:.init(w:20), paddingRight:.init(w:20))
        
        ButtonSStackView.anchorView(bottom:AleartView.bottomAnchor,paddingBottom:.init(h:20),width:UIdeviceSize.width*0.6715, height: UIdeviceSize.height*0.0536)
        ButtonSStackView.centerX(inView:view)
    }
    
    //MARK: -  BUTTON ACTIONS
    
    @objc func cancel() {
        delegate?.pressAction(firstButton: true)
        dismiss(animated:true) {
            self.buttonAction?()
        }
        
    }
    
    
    @objc func remove() {
        delegate?.pressAction(firstButton: false)
        dismiss(animated:true) {
            self.buttonAction?()
        }
    }
    
}




