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
        thisView.contentMode = .scaleAspectFill
        thisView.layer.cornerRadius = .init(h: 25)
        thisView.clipsToBounds = true
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
        loaderImage.anchorView(width: .init(w:100),height: .init(w:100))
        loaderImage.centerX(inView:view)
        loaderImage.centerY(inView: view)
        loaderImage.loadGif(name:"Loader")
        
    }
    
    func dismissLoader(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.dismiss(animated: true)
        })
        
    }
}
