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
    var categories = [Catagorie]()
    var items = [Item]()
    
    init(name: String, id: String, pin: Int, settings: String, categories: [Catagorie] = [Catagorie](), items: [Item] = [Item]()) {
        self.name = name
        self.id = id
        self.pin = pin
        self.settings = settings
        self.categories = categories
        self.items = items
    }
    
    
}



struct Catagorie {
    var id:String
    var name:String
    var albums:String
    
    init(id: String, name: String, albums: String) {
        self.id = id
        self.name = name
        self.albums = albums
    }
}


struct Item {
    var id:String
    var name:String
    var type:String
    var Size:CGFloat
    var resource:String
    
    init(id: String, name: String, type: String, Size: CGFloat, resource: String) {
        self.id = id
        self.name = name
        self.type = type
        self.Size = Size
        self.resource = resource
    }
}
