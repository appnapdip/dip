//
//  CollectioViewExtension.swift
//  newproject
//
//  Created by New User on 7/10/23.
//

import Foundation
import UIKit


extension UICollectionView {
    
    func collectioView(backgroundColor:UIColor = .brown)-> UICollectionView {
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame:.zero, collectionViewLayout:layout)
        collection.backgroundColor = backgroundColor
        return collection
    }
    
}
