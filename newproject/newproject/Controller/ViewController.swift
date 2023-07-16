//
//  ViewController.swift
//  newproject
//
//  Created by New User on 7/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let pinTitle:UILabel = {
        let hexColor = UIColor(hex:"#000000")
        let thisLabel = UILabel().label(title:"Create PIN", textColor:hexColor,fontStyle:UIFont(name: "Poppins-Regular", size:28),allignment:.center)
        return thisLabel
        
}()
    
let pinSubTitle:UILabel = {
        let hexColor = UIColor(hex:"#5A5F73")
    let thisLabel = UILabel().label(title:"Create a PIN to lock your account", textColor:hexColor,fontStyle:UIFont(name: "Poppins-Regular", size:16),allignment:.center)
        return thisLabel
}()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        if !UserDefaults.standard.bool(forKey:"onboardingShown") {
            let vc = collectionViewController()
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
       }
//        else {
//           print("on borading shown")
//        }
    }
    // MARK: - loading userInterface
    private func loadUI(){
        view.addSubview(pinTitle)
        view.addSubview(pinSubTitle)
        pinTitle.anchorView(top:view.topAnchor,paddingTop:.init(h:66),width:UIdeviceSize.width - .init(w:173))
        pinTitle.centerX(inView:view)
        pinSubTitle.anchorView(top:pinTitle.bottomAnchor,paddingTop:.init(h:12),width:UIdeviceSize.width - .init(w:73))
        pinSubTitle.centerX(inView:view)
        
    }
    
}

