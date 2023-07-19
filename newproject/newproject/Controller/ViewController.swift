//
//  ViewController.swift
//  newproject
//
//  Created by New User on 7/6/23.
//

import UIKit

class ViewController: UIViewController,Onboarding {
 
    
    
  
    
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(hex:"#F2F3FA")
        view.backgroundColor = backgroundColor
        
        
    }
    
    func dismissCall() {
        dismiss(animated: true) {
            UserDefaults.standard.set(true, forKey:"onboardingShown")
            let pin = PinViewController()
            pin.modalPresentationStyle = .fullScreen
            pin.modalTransitionStyle = .crossDissolve
            self.present(pin, animated:true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        
        
        if !UserDefaults.standard.bool(forKey:"onboardingShown") {
            let vc = collectionViewController()
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
        
        else {
            let vc = PinViewController()
            
            if let EnterPin = UserDefaults.standard.string(forKey:"savePin") {
                
                vc.pinSubTitle.text = "Enter PIN"
                vc.pinTitle.text = "Please enter your 6 digit PIN"
                
            }
            
        
          
        }
    }
    
    
}
