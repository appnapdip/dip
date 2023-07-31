//
//  User.swift
//  newproject
//
//  Created by New User on 7/24/23.
//

import Foundation
import UIKit



struct User {
    var name:String
    var id:String
    var pin:Int
    var settings:String
    var allAlbumCategories = [Catagorie]()
    var itemCatagories = [Catagorie]()
    
    init(name: String = "123", id: String = "2345", pin: Int = 0, settings: String = "", allAlbumCategories: [Catagorie] = [Catagorie](), itemCatagories: [Catagorie] = [Catagorie]()) {
        self.name = name
        self.id = id
        self.pin = pin
        self.settings = settings
        self.allAlbumCategories = allAlbumCategories
        self.itemCatagories = itemCatagories
    }
    
}



struct Catagorie {
    var id:String
    var name:String
    var albums = [Album]()
    var items = [Item]()
    
    init(id: String, name: String, albums: [Album] = [Album](), items: [Item] = [Item]()) {
        self.id = id
        self.name = name
        self.albums = albums
        self.items = items
    }
}

struct Item {
    var id:String
    var name:String
    var type:String
    var Size:CGFloat
    var resource:String
    
    init(id: String = "6789", name: String = "item", type: String = "type", Size: CGFloat = 0, resource: String = "resource") {
        self.id = id
        self.name = name
        self.type = type
        self.Size = Size
        self.resource = resource
        
    }
}



struct Album {
    var id:String
    var icon:String
    var name:String
    var size:String
    var isLocked:Bool
    var items:[Item]
    
    init(id: String, icon:String, name:String, size:String, isLocked: Bool, items: [Item]) {
        self.id = id
        self.icon = icon
        self.name = name
        self.size = size
        self.isLocked = isLocked
        self.items = items
    }
    
    
  }
    




