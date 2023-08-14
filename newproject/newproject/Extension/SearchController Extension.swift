//
//  SearchController Extension.swift
//  newproject
//
//  Created by New User on 8/14/23.
//

import Foundation
import UIKit

// MARK: - Two SearchController Extension


// searchbar show extension

extension searchController :UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {return}
        
        if text.isEmpty{
            data = allData
            
        }else{
            data = allData.filter({ data in
                if let album = data as? Album{
                    return album.name.contains(text)
                    
                }else{
                    let item = data as! Item
                    return item.name.contains(text)
                }
            })
        }
        
        DispatchQueue.main.async {
            self.searchCollectioView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.isEmpty else {return}
        data = allData
        searchCollectioView.reloadData()
    }
}

//  searchbar collectionview items  extension

extension searchController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let album = data[indexPath.item] as? Album {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"albumsCustomCell", for: indexPath) as! albumsCustomCell
            cell.albumsTitle.text = album.name
            cell.albumsizeTitle.text = album.size
            cell.albumIcon.text = album.icon // folders data
            return cell
            
        }else{
            let item = data[indexPath.item] as? Item
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"itemImageCell", for:indexPath) as! itemImageCell
            cell.itemImageView.image = UIImage(named:item?.resource ?? "")
            cell.itemImageView.contentMode = .scaleAspectFill
            cell.itemImageView.clipsToBounds = true
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: .init(w:183), height: .init(h:140,for:183))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:.init(h:0), left:.init(w:0), bottom: .init(h:0), right: .init(w:0))
        
    }
    
    
}
