//
//  UIToastView.swift
//  newproject
//
//  Created by New User on 7/20/23.
//

import Foundation
import UIKit


// MARK: - showToast,singleButtonAlert,doubleButtonAleart
extension UIViewController {
    
    func showToast(message : String, font: UIFont = UIFont(name:"Poppins-Medium", size:14)!) {
        
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.white
        toastLabel.textColor = UIColor(hex: "#1AB662")
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = .init(h:16)
        toastLabel.layer.borderColor = UIColor(hex:"#1AB662").cgColor
        toastLabel.layer.borderWidth = .init(h:0.5)
        toastLabel.clipsToBounds =  true
        self.view.addSubview(toastLabel)
        toastLabel.anchorView(top: view.topAnchor,paddingTop:UIdeviceSize.height * 0.45, width: .init(w:364), height: .init(h:62))
        toastLabel.centerX(inView:view)
        UIView.animate(withDuration: 2.0, delay: 0.1, options:.curveEaseInOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
    func singleButtonAlert(tittle:String = AlertMessage.welcome.messageTitle ,subTitle:String = AlertMessage.welcome.messageSubTitle, firstButtonTitle:String = AlertMessage.welcome.firstButtonTitle, firstButtonBackGrounColor:UIColor = UIColor.clear, completion: @escaping()->Void) -> AleartViewController{
        
        let thisVC = AleartViewController()
        thisVC.buttonAction = completion
        //thisVC.showSingleButton = true
        thisVC.AleartTitle.text = tittle
        thisVC.AleartSubTitle.text = subTitle
        thisVC.primrayButton.setTitle(firstButtonTitle, for:.normal)
        thisVC.modalPresentationStyle = .fullScreen
        thisVC.modalTransitionStyle = .crossDissolve
        return thisVC
    }
    
    func doubleButtonAleart(tittle:String = AlertMessage.succes.messageTitle , subTitle:String = AlertMessage.succes.messageSubTitle , firstButtonTitle:String = AlertMessage.welcome.firstButtonTitle ,firstButtonBackGrounColor:UIColor = UIColor.clear,secondButtonTitle:String = AlertMessage.succes.secondButtonTitle,secondButtonBackGroundColor:UIColor = UIColor.clear,completion: @escaping() -> Void)-> AleartViewController {
        
        let thisVC = AleartViewController()
        thisVC.buttonAction = completion
        //thisVC.showSingleButton = false
        thisVC.AleartTitle.text = tittle
        thisVC.AleartSubTitle.text = subTitle
        thisVC.primrayButton.setTitle(firstButtonTitle, for:.normal)
        thisVC.secondaryButton.setTitle(secondButtonTitle, for: .normal)
        thisVC.modalPresentationStyle = .fullScreen
        thisVC.modalTransitionStyle = .crossDissolve
        return thisVC
        
    }
    
}
