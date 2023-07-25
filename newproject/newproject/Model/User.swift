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
    var albumCategories = [Catagorie]()
    var itemCatagories = [Item]()
    
    init(name: String = "", id: String = "", pin: Int = 0, settings: String = "", albumCategories: [Catagorie] = [Catagorie](), itemCatagories: [Item] = [Item]()) {
        self.name = name
        self.id = id
        self.pin = pin
        self.settings = settings
        self.albumCategories = albumCategories
        self.itemCatagories = itemCatagories
    }
    
}



struct Catagorie {
    var id:String
    var name:String
    var albums = [Album]()
    
    init(id: String, name: String, albums: [Album] = [Album]()) {
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
    
    init(id: String, name: String, type: String, Size: CGFloat, resource: String, catagories: [Catagorie] = [Catagorie]()) {
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
    
    init(id: String, name: String, icon: String, items: [Item], size: CGFloat, isLocked: Bool) {
        self.id = id
        self.name = name
        self.icon = icon
        self.items = items
        self.size = size
        self.isLocked = isLocked
    }
    
}



