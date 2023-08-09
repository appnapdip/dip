//
//  Refactors.swift
//  newproject
//
//  Created by New User on 7/20/23.
//

import Foundation
import UIKit

// MARK: - ToastMessage Types
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


// MARK: - AleartMessage Types
enum AlertMessage {
    case welcome
    case networkError
    case succes
    case failed
    case somethingWrong
    case inProgress
    case restricted
    case limited
    case denied
    
    
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
        case .inProgress:
            return "In Progress"
        case .restricted:
            return "Restricted"
        case .denied:
            return "Denied"
        case .limited:
            return "Limited"
            
        }
    }
    
    var messageSubTitle:String {
        switch self {
        case .welcome:
            return "Hello There!, Hope You Liking Our Application"
        case .networkError:
            return "NetworkError Shown Here"
        case .succes:
            return "Sucessfully Loading To The View"
        case .failed:
            return "Failing To Show Data"
        case .somethingWrong:
            return "Something Wrong Happend"
        case .inProgress:
            return "We Are Woking On It, Please try again Later"
        case .restricted:
           return  "You can change photo access permission from seetings"
        case .limited:
           return "You can change photo access permission from seetings"
        case .denied:
            return "You can change photo access permission from seetings"
        }
    }
    
    var  firstButtonTitle:String {
        switch self {
        case .welcome:
            return "Okay"
        case .networkError:
            return "Error"
        case .succes:
            return "Sucess"
        case .failed:
            return "Failed"
        case .somethingWrong:
            return "Wrong"
        case .inProgress:
            return "Ok"
            
        case .restricted:
           return "Ok"
        case .limited:
            return "Ok"
        case .denied:
            return "Ok"
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
        case .inProgress:
            return "Done"
            
        case .restricted:
           return  "Settings"
        case .limited:
            return  "Settings"
        case .denied:
            return  "Settings"
        }
    }
}
