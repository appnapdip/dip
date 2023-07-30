//
//  CatagoriesExtension.swift
//  newproject
//
//  Created by New User on 7/30/23.
//

import Foundation
import UIKit


extension UIViewController {
    func catagorie() -> [Catagorie] {
        
        
        let albums1:[Album] = albums()
        let albums2:[Album] = albums()
        let total: [Album] = albums1+albums2
        
        let buttonCatagorie1 = Catagorie(id:"", name: "All", albums: total)
        let buttonCatagorie2 = Catagorie(id:"", name: "Unlocked",albums:albums())
        let buttonCatagorie3 = Catagorie(id:"", name: "Locked",albums:albums() + albums() + albums())
        let buttonCatagorie4 = Catagorie(id:"", name: "Others",albums:total + total)
        let buttonCatagorie5 = Catagorie(id:"", name: "Photos",albums: total)
        
        return[buttonCatagorie1,buttonCatagorie2,buttonCatagorie3,buttonCatagorie4,buttonCatagorie5]
    }
    
    func itemsCatagorie() ->[Item] {
        let button1 = Item(id: "", name: "All", type: "", Size: 0, resource: "")
        let button2 = Item(id: "", name: "Photos", type: "", Size: 0, resource: "")
        let button3 = Item(id: "", name: "Videos", type: "", Size: 0, resource: "")
        let button4 = Item(id: "", name: "Others", type: "", Size: 0, resource: "")
        return[button1,button2,button3,button4]
        
    }
    
}
