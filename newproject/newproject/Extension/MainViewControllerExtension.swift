//
//  MainViewControllerExtension.swift
//  newproject
//
//  Created by New User on 8/14/23.
//

import Foundation
import UIKit


// MARK: - MainView Controller Extension


extension ViewController :  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // show numbers of items
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == buttonsCollectioView {
            if isAlbumSeleted {
                return usermainDevice.allAlbumCategories.count // album catagorie count
            }
            return usermainDevice.itemCatagories.count // items catagorie count
        }
        
        else if collectionView == itemCollectionView {
            return  usermainDevice.itemCatagories[currentIndexItem].items.count
        }
        
        else {
            return usermainDevice.allAlbumCategories[currentIndexAlbum].albums.count // folders count
        }
        
    }
    
    // show items in the cells
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == buttonsCollectioView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"VCCustomCell", for: indexPath) as! buttonsCustomCell
            cell.allcatagoriesTiltle.text = isAlbumSeleted ? usermainDevice.allAlbumCategories[indexPath.item].name : usermainDevice.itemCatagories[indexPath.item].name
            if indexPath.item == (isAlbumSeleted ? currentIndexAlbum : currentIndexItem)  {
                cell.backgroundColor = UIColor(hex:"#323336")
                cell.allcatagoriesTiltle.textColor = UIColor(hex:"#FFFFFF")
                
            }
            else {
                cell.backgroundColor = UIColor(hex:"#FFFFFF")
                cell.allcatagoriesTiltle.textColor = UIColor(hex:"#838BA7") // album catagorie and item catagorie data
                
            }
            return cell
        }
        
        else if collectionView == itemCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ITCustomCell", for:indexPath) as! itemImageCell
            cell.itemImageView.image = UIImage(named:usermainDevice.itemCatagories[currentIndexItem].items[indexPath.item].resource)
            return cell
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ACCustomCell", for: indexPath) as! albumsCustomCell
            let folderTypes = usermainDevice.allAlbumCategories[currentIndexAlbum].albums[indexPath.item]
            cell.albumsTitle.text = folderTypes.name
            cell.albumsizeTitle.text = folderTypes.size
            cell.albumIcon.text = folderTypes.icon // folders data
            return cell
        }
        
    }
    
    // MARK: - Size For Item
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == buttonsCollectioView {
            return CGSize(width: .init(w:96), height: .init(h:46))   // album and item cell size
        }
        else if collectionView == itemCollectionView {
            return CGSize(width: .init(w:136), height: .init(h:136,for:136))
        }
        else {
            return CGSize(width: .init(w:183), height: .init(h:140,for:183)) // folder cell size
        }
    }
    
    //  frame of Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == buttonsCollectioView {
            return UIEdgeInsets(top:.init(h:0), left:.init(w:16), bottom: .init(h:0), right: .init(w:0))  // album and item cell edege insects
        }
        
        else if collectionView == itemCollectionView {
            return UIEdgeInsets(top:.init(h:0), left:.init(w:0), bottom: .init(h:0), right: .init(w:0))
        }
        
        else {
            return UIEdgeInsets(top:.init(h:0), left:.init(w:0), bottom: .init(h:0), right: .init(w:0))  // folders cell edege insects
        }
    }
    
    // select items in the collectionView
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // update the index of  button cell
        if collectionView == buttonsCollectioView {
            if isAlbumSeleted{
                currentIndexAlbum = indexPath.item
                print("select \(currentIndexAlbum)")
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                collectionView.reloadData()
                albumsCollectioView.reloadData()
                
            }else{
                currentIndexItem = indexPath.item
                print("select \(currentIndexItem)")
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                collectionView.reloadData()
                itemCollectionView.reloadData()
            }
        }
    }
}
