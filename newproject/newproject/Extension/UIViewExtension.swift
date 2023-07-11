//
//  UIviewExtension.swift
//  newproject
//
//  Created by New User on 7/10/23.
//

import Foundation
import UIKit

extension UIView {
    
    func showView(backgroundColor:UIColor = .blue,conerRadius:CGFloat = 5)->UIView {
        let View = UIView()
        View.backgroundColor = backgroundColor
        View.layer.cornerRadius = conerRadius
        return View
        
    }
    
}
