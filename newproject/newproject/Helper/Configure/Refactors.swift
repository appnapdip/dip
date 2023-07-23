//
//  Refactors.swift
//  newproject
//
//  Created by New User on 7/20/23.
//

import Foundation
import UIKit


enum ToastMessage {
    case welcome
    case networkError
    
    var description: String{
        switch self {
        case .welcome:
            return "Hello there, Welcome!"
        case .networkError:
            return "Network Error!"
        }
    }
}

enum ProjectFont{
    case Poppins(size: CGFloat)
    
    var regular: UIFont{
        switch self {
        case .Poppins(let size):
            return UIFont(name: "Poppins-Regular", size: size)!
        }
    }
    
    var light: UIFont{
        switch self {
        case .Poppins(let size):
            return UIFont(name: "Poppins-Light", size: size)!
        }
    }
}



enum AleartMessage {
    
    case welcome
    case networkError
    case succes
    case failed
    case somethingWrong
    
    var messageTitle:String {
        switch self {
            
        case .welcome:
           return "Welcome!"
        case .networkError:
             return "networkError Happen!"
        case .succes:
           return "sucessfully loading!"
        case .failed:
            return "failed to show data!"
        case .somethingWrong:
            return "something wrong happend"
        }
    }
    
    var messageSubTitle:String {
        return  "This album will no longer required any password to be viewed"
    }
    
    var  firstButtonTitle:String {
        return "firstButton"
    }
    
    var secondButtonTitle:String {
        return "secondButton"
    }
    
    
}
