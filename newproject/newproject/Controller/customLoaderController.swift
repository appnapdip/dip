//
//  customLoaderController.swift
//  newproject
//
//  Created by New User on 8/12/23.
//

import Foundation
import UIKit


class customLoaderController:UIViewController {
    
    let loaderImage:UIImageView = {
        let thisView = UIImageView()
        return thisView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        loaderUI()
        
    }
    
   
 
    
    
    private func loaderUI() {
        view.backgroundColor = .black.withAlphaComponent(0.3)
        view.addSubview(loaderImage)
        loaderImage.anchorView(top:view.topAnchor,paddingTop:UIdeviceSize.height * 0.5 , width: .init(w:245),height: .init(h:245))
        loaderImage.centerX(inView:view)
        loaderImage.loadGif(name:"Loader")
        
        
        
    }
    
}
