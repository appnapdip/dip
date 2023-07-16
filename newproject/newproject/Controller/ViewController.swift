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
    
    
    let stackButton:UIButton = {
        let backgroundColor = UIColor(hex:"#D6D8E2")
        let thisButton = UIButton()
        thisButton.backgroundColor = backgroundColor
        thisButton.layer.cornerRadius = .init(w:16) / 2
        return thisButton
    }()
    
    let stackButton2:UIButton = {
        let backgroundColor = UIColor(hex:"#D6D8E2")
        let thisButton = UIButton()
        thisButton.backgroundColor = backgroundColor
        thisButton.layer.cornerRadius = .init(w:16) / 2
        return thisButton
    }()
    
    
    let stackButton3:UIButton = {
        let backgroundColor = UIColor(hex:"#D6D8E2")
        let thisButton = UIButton()
        thisButton.backgroundColor = backgroundColor
        thisButton.layer.cornerRadius = .init(w:16) / 2
        return thisButton
    }()
    
    
    let stackButton4:UIButton = {
        let backgroundColor = UIColor(hex:"#D6D8E2")
        let thisButton = UIButton()
        thisButton.backgroundColor = backgroundColor
        thisButton.layer.cornerRadius = .init(w:16) / 2
        return thisButton
    }()
    
    
    
    let stackButton5:UIButton = {
        let backgroundColor = UIColor(hex:"#D6D8E2")
        let thisButton = UIButton()
        thisButton.backgroundColor = backgroundColor
        thisButton.layer.cornerRadius = .init(w:16) / 2
        return thisButton
    }()
    
    let stackButton6:UIButton = {
        let backgroundColor = UIColor(hex:"#D6D8E2")
        let thisButton = UIButton()
        thisButton.backgroundColor = backgroundColor
        thisButton.layer.cornerRadius = .init(w:16) / 2
        return thisButton
    }()
    
    
    let pinStackView:UIStackView = {
        let thisPinStackView = UIStackView()
        thisPinStackView.axis = NSLayoutConstraint.Axis.horizontal
        thisPinStackView.distribution = .fillEqually
        //thisPinStackView.alignment = .fill
        thisPinStackView.spacing = .init(w:12)
        //thisPinStackView.backgroundColor = .green
        return thisPinStackView
        
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
        view.addSubview(pinStackView)
        
        pinStackView.addArrangedSubview(stackButton)
        pinStackView.addArrangedSubview(stackButton2)
        pinStackView.addArrangedSubview(stackButton3)
        pinStackView.addArrangedSubview(stackButton4)
        pinStackView.addArrangedSubview(stackButton5)
        pinStackView.addArrangedSubview(stackButton6)
        
        
        
        
        
        
        pinTitle.anchorView(top: view.topAnchor,paddingTop:.init(h:66),width: UIdeviceSize.width - .init(w:173))
        pinTitle.centerX(inView:view)
        pinSubTitle.anchorView(top:pinTitle.bottomAnchor,paddingTop:.init(h:12),width:UIdeviceSize.width - .init(w:73))
        pinSubTitle.centerX(inView:view)
        pinStackView.anchorView(top:pinSubTitle.bottomAnchor,paddingTop: .init(h:108), width: .init(w: 156), height: .init(w:16))
        pinStackView.centerX(inView:view)
        
        
    }
    
}

