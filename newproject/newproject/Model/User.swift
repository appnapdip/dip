//
//  User.swift
//  newproject
//
//  Created by New User on 7/24/23.
//

import Foundation


struct User {
    var name:String
    var id:String
    var pin:Int
    var settings:String
    var categories = [catagorie]()
    var items = [item]()
    
    
}



struct catagorie {
    var id:String
    var name:String
    var albums:String
}


struct item {
    var id:String
    var name:String
    var type:String
    var Size:CGFloat
    var resource:String
    
    
}
