//
//  customLoaderController.swift
//  newproject
//
//  Created by New User on 8/12/23.
//

import Foundation
import UIKit


class customLoaderController:UIViewController {
    // MARK: - loaderImage Property
    
    let loaderImage:UIImageView = {
        let thisView = UIImageView()
        return thisView
    }()
    
    //   MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        loaderUI()
    }
    
    //   MARK: - loaderUI()
    
    private func loaderUI() {
        view.backgroundColor = .black.withAlphaComponent(0.3)
        
        /// loaderImage
        view.addSubview(loaderImage)
        loaderImage.anchorView(top:view.topAnchor,paddingTop:UIdeviceSize.height * 0.5 , width: .init(w:245),height: .init(h:245))
        loaderImage.centerX(inView:view)
        loaderImage.loadGif(name:"Loader")
        
    }
}
