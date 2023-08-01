//
//  CatagoriesExtension.swift
//  newproject
//
//  Created by New User on 7/30/23.
//

import Foundation
import UIKit

// // MARK: - Create UIViewController Functions For Store Data
extension UIViewController {
    func catagorie() -> [Catagorie] {
        let albums1:[Album] = albums()
        let albums2:[Album] = albums()
        let total: [Album] = albums1+albums2
        
        let buttonCatagorie1 = Catagorie(id:"", name: "All", albums: total)
        let buttonCatagorie2 = Catagorie(id:"", name: "Unlocked",albums:albums())
        let buttonCatagorie3 = Catagorie(id:"", name: "Locked",albums:albums() + albums() + albums())
        return[buttonCatagorie1,buttonCatagorie2,buttonCatagorie3]
    }
    
    func itemsCatagorie() ->[Catagorie] {
        let items1:[Item] = Items()
        let items2:[Item] = Items()
        let items: [Item] = Items() + Items()
        
        let buttonCatagorie1 = Catagorie(id:"", name: "All", albums:[],items:items1)
        let buttonCatagorie2 = Catagorie(id:"", name: "Photos",albums:[],items:items1 + items2)
        let buttonCatagorie3 = Catagorie(id:"", name: "Videos",albums: [],items:items)
        let buttonCatagorie4 = Catagorie(id:"", name: "Others",albums:[],items:items2)
        return[buttonCatagorie1,buttonCatagorie2,buttonCatagorie3,buttonCatagorie4]
        
    }
    
}
