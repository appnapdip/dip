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
            return "NetworkError!"
        case .succes:
            return "Sucessfully Loading!"
        case .failed:
            return "Failed to Show!"
        case .somethingWrong:
            return "Something Wrong Happend"
        }
    }
    
    var messageSubTitle:String {
        switch self {
        case .welcome:
            return "Welcome Here"
        case .networkError:
            return "NetworkError Shown Here"
        case .succes:
            return "Sucessfully Loading To The View"
        case .failed:
            return "Failing To Show Data"
        case .somethingWrong:
            return "Something Wrong Happend"
        }
    }
    
    var  firstButtonTitle:String {
        switch self {
        case .welcome:
            return "Welcome"
        case .networkError:
            return "Error"
        case .succes:
            return "Sucess"
        case .failed:
            return "Failed"
        case .somethingWrong:
            return "Wrong"
        }
    }
    
    var secondButtonTitle:String {
        switch self {
        case .welcome:
            return "Welcome"
        case .networkError:
            return "Error"
        case .succes:
            return "Sucess"
        case .failed:
            return "Failed"
        case .somethingWrong:
            return "Wrong"
        }
    }
    
    
}
