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
    var allAlbumCategories = [Catagorie]()
    var itemCatagories = [Item]()
    
    init(name: String = "Dip", id: String = "1234", pin: Int = 0, settings: String = "settings", allAlbumCategories: [Catagorie] = [Catagorie](), itemCatagories: [Item] = [Item]()) {
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
    
    init(id: String = "2345", name: String = "all", albums: [Album] = [Album]()) {
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
    var catagories = [Catagorie]()
    
    init(id: String = "6789", name: String = "item", type: String = "type", Size: CGFloat = 0, resource: String = "resource", catagories: [Catagorie] = [Catagorie]()) {
        self.id = id
        self.name = name
        self.type = type
        self.Size = Size
        self.resource = resource
        self.catagories = catagories
    }
}



struct Album {
    var id:String
    var name:String
    var icon:String
    var items:[Item]
    var size:CGFloat
    var isLocked:Bool
    
    init(id: String = "4567", name: String = "Main", icon: String = "icon", items: [Item] = [], size: CGFloat = 10, isLocked:Bool = false) {
        self.id = id
        self.name = name
        self.icon = icon
        self.items = items
        self.size = size
        self.isLocked = isLocked
    }
    
}



