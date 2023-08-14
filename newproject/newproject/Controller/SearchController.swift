//
//  SearchController.swift
//  newproject
//
//  Created by New User on 8/13/23.
//

import Foundation
import UIKit

// MARK: - Serach  On Items Page

class searchController:UIViewController, UISearchBarDelegate {
    
    // MARK: - Properties
    var data: [Any] = []
    
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
        thisSearchBar.layer.cornerRadius = .init(w:14)
        thisSearchBar.layer.borderColor = UIColor.black.cgColor
        thisSearchBar.layer.borderWidth = .init(w:1)
        thisSearchBar.searchTextField.backgroundColor = .white
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
        data = albums()
        data = Items()
        
    }
    
    // MARK: - loadUI()
    
    private func loadUI() {
        
        /// backButton
        view.addSubview(backButton)
        backButton.anchorView(top:view.topAnchor,left:view.leftAnchor, paddingTop: .init(h:100),width:.init(h:64),height: .init(h:64))
        
        /// searchBar
        view.addSubview(searchBar)
        searchBar.delegate =  self
        searchBar.anchorView(left:backButton.rightAnchor, width: .init(w:300))
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


extension  searchController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let album = data[indexPath.item] as? Album{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"albumsCustomCell", for: indexPath) as! albumsCustomCell
            cell.albumsTitle.text = album.name
            cell.albumsizeTitle.text = album.size
            cell.albumIcon.text = album.icon // folders data
            return cell
        }else{
            let item = data[indexPath.item] as! Item
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"itemImageCell", for:indexPath) as! itemImageCell
            cell.itemImageView.image = UIImage(named:item.resource)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if data[indexPath.item] is Album {
            
             return CGSize(width: .init(w:183), height: .init(h:140,for:183))
        }
        else {
            
            return CGSize(width: .init(w:136), height: .init(h:136,for:136))
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if data[section.byteSwapped] is Album {
            return UIEdgeInsets(top:.init(h:0), left:.init(w:0), bottom: .init(h:0), right: .init(w:0))
        }
        else {
           
            return UIEdgeInsets(top:.init(h:0), left:.init(w:0), bottom: .init(h:0), right: .init(w:0))
        }
        
    }
    
    
}
