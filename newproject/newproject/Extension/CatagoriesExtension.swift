//
//  CatagoriesExtension.swift
//  newproject
//
//  Created by New User on 7/30/23.
//

import Foundation
import UIKit

//  MARK: - Create UIViewController Functions For Store Data

extension ViewController {
    
    func catagorie() -> [Catagorie] {
        
        let albums1:[Album] = albums()
        let albums2:[Album] = albums()
     
        
        let buttonCatagorie1 = Catagorie(id:"", name: "All", albums: albums1)
        let buttonCatagorie2 = Catagorie(id:"", name: "Unlocked",albums:albums2)
        let buttonCatagorie3 = Catagorie(id:"", name: "Locked",albums:albums1)
        return[buttonCatagorie1,buttonCatagorie2,buttonCatagorie3]
    }
    
    func itemsCatagorie() ->[Catagorie] {
        let items1:[Item] = Items()
        let items2:[Item] = Items()
       
        
        let buttonCatagorie1 = Catagorie(id:"", name: "All", albums:[],items:items1)
        let buttonCatagorie2 = Catagorie(id:"", name: "Photos",albums:[],items:items1)
        let buttonCatagorie3 = Catagorie(id:"", name: "Videos",albums: [],items:items1)
        let buttonCatagorie4 = Catagorie(id:"", name: "Others",albums:[],items:items2)
        return[buttonCatagorie1,buttonCatagorie2,buttonCatagorie3,buttonCatagorie4]
        
    }
}
