//
//  imageExtension.swift
//  newproject
//
//  Created by New User on 7/10/23.
//

import Foundation
import UIKit

extension UIImageView {
    
    func Image(contantMode:UIView.ContentMode = .scaleToFill, cornerRadius:CGFloat = 0)->UIImageView {
    
        let image = UIImageView()
        image.contentMode = contantMode
        image.layer.cornerRadius = cornerRadius
        return image
    }
    
}
