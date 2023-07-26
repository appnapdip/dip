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
//    var allAlbumCategories = [Catagorie]()
//    var itemCatagories = [Item]()
    
    init(name: String = "Dip", id: String = "1234", pin: Int = 0, settings: String = "settings") {
        self.name = name
        self.id = id
        self.pin = pin
        self.settings = settings
    }
    
}



struct Catagorie {
    var id:String
    var name:String
    //var albums = [Album]()
    
    init(id: String, name:String) {
        self.id = id
        self.name = name
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
    var icon:String
    var name:String
    var size:String
    var isLocked:Bool
    var items:[Item]
    
    init(id: String, icon: String, name: String, size: String, isLocked: Bool, items: [Item]) {
        self.id = id
        self.icon = icon
        self.name = name
        self.size = size
        self.isLocked = isLocked
        self.items = items
    }
    
    
  }
    




