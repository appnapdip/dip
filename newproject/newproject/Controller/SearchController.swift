//
//  SearchController.swift
//  newproject
//
//  Created by New User on 8/13/23.
//

import Foundation
import UIKit

// MARK: - Serach  On Items Page

class searchController:UIViewController {
    
    // MARK: - Properties
    var data: [Any] = []
    var allData:[Any] = []
    
    // backButton
    
    lazy var backButton: UIButton = {
        let thisButton = UIButton().button(backgroundImage: UIImage(systemName:"chevron.backward"))
        thisButton.tintColor = .black
        thisButton.addTarget(self, action: #selector(pressBackAction), for: .touchUpInside)
        return thisButton
    }()
    
    //  searchBar
    
    lazy var searchBar:UISearchBar = {
        let thisSearchBar = UISearchBar()
        thisSearchBar.backgroundColor = .clear
        thisSearchBar.searchBarStyle = .minimal
        thisSearchBar.layer.cornerRadius = .init(w:14)
        thisSearchBar.layer.borderColor = UIColor.black.cgColor
        thisSearchBar.layer.borderWidth = .init(w:1)
        thisSearchBar.searchTextField.backgroundColor = .clear
        return thisSearchBar
    }()
    
    
    lazy var searchCollectioView: UICollectionView = {
        let thisLayout =  UICollectionViewFlowLayout()
        thisLayout.scrollDirection = .vertical
        var thisCollection = UICollectionView(frame:.zero, collectionViewLayout:thisLayout)
        thisCollection.showsVerticalScrollIndicator = false
        thisLayout.minimumLineSpacing = .init(h:16)
        thisLayout.minimumInteritemSpacing = 0
        thisCollection.backgroundColor = .clear
        thisCollection.register(albumsCustomCell.self, forCellWithReuseIdentifier: "albumsCustomCell")
        thisCollection.register(itemImageCell.self, forCellWithReuseIdentifier: "itemImageCell")
        return thisCollection
    }()
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadUI()
        allData = albums()
        allData += Items()
        data = allData
        
    }
    
    // MARK: - loadUI()
    
    private func loadUI() {
        
        /// backButton
        view.backgroundColor = UIColor(hex:"#F2F3FA")
        view.addSubview(backButton)
        backButton.anchorView(top:view.topAnchor,left:view.leftAnchor, paddingTop: .init(h:64),width:.init(h:64),height: .init(h:64))
        
        /// searchBar
        view.addSubview(searchBar)
        searchBar.delegate =  self
        searchBar.anchorView(left:backButton.rightAnchor, right: view.rightAnchor, paddingRight: .init(w: 20), height: .init(h: 55))
        searchBar.centerY(inView:backButton)
        
        view.addSubview(searchCollectioView)
        searchCollectioView.delegate = self
        searchCollectioView.dataSource = self
        searchCollectioView.anchorView(top:searchBar.bottomAnchor,left:view.leftAnchor,bottom:view.bottomAnchor,right:view.rightAnchor,paddingTop:.init(h:28),paddingLeft: .init(w:16),paddingRight:.init(w:16))
    }
    
    // MARK: - pressBackAction to pop
    
    @objc func pressBackAction() {
        navigationController?.popToRootViewController(animated:true)
    }
    
}



