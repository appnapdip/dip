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
        return[buttonCatagorie1,buttonCatagorie2,buttonCatagorie3]
    }
    
    func itemsCatagorie() ->[Catagorie] {
        let buttonCatagorie1 = Catagorie(id:"", name: "All", albums:[],items:[])
        let buttonCatagorie2 = Catagorie(id:"", name: "Photos",albums:[],items:[])
        let buttonCatagorie3 = Catagorie(id:"", name: "Videos",albums: [],items:[])
        let buttonCatagorie4 = Catagorie(id:"", name: "Others",albums:[],items:[])
        return[buttonCatagorie1,buttonCatagorie2,buttonCatagorie3,buttonCatagorie4]
        
    }
    
}
