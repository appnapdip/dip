//
//  UIToastView.swift
//  newproject
//
//  Created by New User on 7/20/23.
//

import Foundation
import UIKit



extension UIViewController {

func showToast(message : String, font: UIFont) {

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
} }
