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
    
    
    lazy var dismissButton:UIButton = {
        let thisButton = UIButton().button(backgroundImage: UIImage(systemName:"multiply"))
        thisButton.addTarget(self, action: #selector(pressDismiss), for: .touchUpInside)
        return thisButton
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loaderUI()
    }
    
    
    
    
    
    
    
    private func loaderUI() {
        view.backgroundColor = .black.withAlphaComponent(0.3)
        
        view.addSubview(loaderImage)
        loaderImage.anchorView(top:view.topAnchor,paddingTop:UIdeviceSize.height * 0.5 , width: .init(w:245),height: .init(h:245))
        loaderImage.centerX(inView:view)
        loaderImage.loadGif(name:"Loader")
        
        view.addSubview(dismissButton)
        dismissButton.anchorView(top: view.topAnchor, right:view.rightAnchor, paddingTop: .init(h: 50), width: .init(w:64), height: .init(h:64))
        
        
        
        
    }
    
    
    @objc func pressDismiss() {
        dismiss(animated:true)
    }
    
}
