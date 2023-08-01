//
//  Cell.swift
//  newproject
//
//  Created by New User on 8/1/23.
//

import Foundation
import UIKit



// MARK: - BUTTONS CUSTOM CELL

class buttonsCustomCell: UICollectionViewCell{
    let allcatagoriesTiltle = UILabel().label(textColor:UIColor(hex:"#838BA7"),lines: 1 ,fontStyle:UIFont(name: "Poopins- Regular", size: .init(h:14)))
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        contentView.addSubview(allcatagoriesTiltle)
        backgroundColor = UIColor(hex: "#FFFFFF")
        layer.cornerRadius = .init(h:12)
        layer.borderColor = UIColor(hex:"#D6D8E2").cgColor
        layer.borderWidth = .init(h:0.5)
        loadUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ButtonscustomCell LoadUI
    private func loadUI() {
        allcatagoriesTiltle.anchorView(top:topAnchor,left:leftAnchor,bottom:bottomAnchor,right:rightAnchor,paddingTop:.init(h:8),paddingLeft: .init(h:16),paddingBottom:.init(h:8),paddingRight:.init(w:16))
        contentView.anchorView(width:UIdeviceSize.width)
    }
}

// MARK: - ALBUMS CUSTOM CELL

class albumsCustomCell: UICollectionViewCell{
    let albumsTitle = UILabel().label(textColor: UIColor(hex:"#323336"),fontStyle:UIFont(name: "Poppins-Medium", size:.init(h:16)),allignment:.left)
    let albumsImage = UIImageView().Image(contantMode:.scaleAspectFit)
    let albumsizeTitle = UILabel().label(textColor: UIColor(hex:"#838BA7"),fontStyle:UIFont(name: "Poppins-Regular", size:.init(h:14)),allignment:.left)
    let albumIcon = UILabel().label(fontStyle:UIFont(name: "Poppins-Medium", size:.init(h:28)),allignment:.left)
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        contentView.addSubview(albumsImage)
        albumsImage.addSubview(albumIcon)
        albumsImage.addSubview(albumsTitle)
        albumsImage.addSubview(albumsizeTitle)
        albumsImage.image = UIImage(named:"Vector")
        loadUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - AlbumCustomCell LoadUI
    private func loadUI() {
        albumsImage.anchorView(top:topAnchor,left:leftAnchor,bottom:bottomAnchor,right:rightAnchor)
        albumIcon.anchorView(top:albumsImage.topAnchor,left:albumsImage.leftAnchor,paddingTop:.init(h:20),paddingLeft:.init(w:22))
        albumsizeTitle.anchorView(left:albumsImage.leftAnchor,bottom:albumsImage.bottomAnchor,paddingLeft:.init(w:22),paddingBottom:.init(h:20))
        albumsTitle.anchorView(left:albumsImage.leftAnchor, bottom:albumsizeTitle.topAnchor,paddingLeft:.init(w:22), paddingBottom:.init(h:6))
        
    }
}

//MARK: - ITEMS IMAGE CELL
class itemImageCell:UICollectionViewCell {
    let itemImageView = UIImageView().Image(contantMode:.scaleAspectFit)
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        contentView.addSubview(itemImageView)
        loadUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - ItemsImageCell LoadUI
    func loadUI() {
        itemImageView.anchorView(top:topAnchor,left:leftAnchor,bottom:bottomAnchor,right:rightAnchor)
    }
}

