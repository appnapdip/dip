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
    
    
    
    let ButtonStackView1:UIStackView = {
        let thisPinStackView = UIStackView()
        thisPinStackView.axis = NSLayoutConstraint.Axis.horizontal
        thisPinStackView.distribution = .fillEqually
        //thisPinStackView.alignment = .fill
        thisPinStackView.spacing = .init(w:32)
        //thisPinStackView.backgroundColor = .green
        return thisPinStackView
        
    }()
   
    
    let pressButton1:UIButton = {
        let thisButton = UIButton().button(title:"1" ,titleColor:.black,backgroundColor:.white,font:UIFont(name:"Poppins-Light", size:32)!,cornerRadius:.init(h:80)/2)
        return thisButton
        
    }()
    
    let pressButton2:UIButton = {
        let thisButton = UIButton().button(title:"2",titleColor:.black,backgroundColor:.white,font:UIFont(name:"Poppins-Light",size:32)!,cornerRadius:.init(h:80)/2)
        return thisButton
    }()
    
   
    
    let pressButton3:UIButton = {
        let thisButton = UIButton().button(title:"3" ,titleColor:.black,backgroundColor:.white,font:UIFont(name:"Poppins-Light",size:32)!,cornerRadius:.init(h:80)/2)
        return thisButton
    }()
    
    
    let ButtonStackView2:UIStackView = {
        let thisPinStackView = UIStackView()
        thisPinStackView.axis = NSLayoutConstraint.Axis.horizontal
        thisPinStackView.distribution = .fillEqually
        //thisPinStackView.alignment = .fill
        thisPinStackView.spacing = .init(w:32)
        //thisPinStackView.backgroundColor = .green
        return thisPinStackView
    }()
    
    
    let pressButton4:UIButton = {
        let thisButton = UIButton().button(title:"4" ,titleColor:.black,backgroundColor:.white, font:UIFont(name:"Poppins-Light", size:32)!,cornerRadius:.init(h:80)/2)
        return thisButton
        
    }()
    
    let pressButton5:UIButton = {
        let thisButton = UIButton().button(title:"5" ,titleColor:.black,backgroundColor:.white,font:UIFont(name:"Poppins-Light", size:32)!,cornerRadius:.init(h:80)/2)
        return thisButton
        
    }()
    
    
    let pressButton6:UIButton = {
        let thisButton = UIButton().button(title:"6" ,titleColor:.black,backgroundColor:.white,font:UIFont(name:"Poppins-Light", size:32)!,cornerRadius:.init(h:80)/2)
        return thisButton
        
    }()
    
    
    let ButtonStackView3:UIStackView = {
        let thisPinStackView = UIStackView()
        thisPinStackView.axis = NSLayoutConstraint.Axis.horizontal
        thisPinStackView.distribution = .fillEqually
        //thisPinStackView.alignment = .fill
        thisPinStackView.spacing = .init(w:32)
        //thisPinStackView.backgroundColor = .green
        return thisPinStackView
    }()
    
    let pressButton7:UIButton = {
        let thisButton = UIButton().button(title:"7" ,titleColor:.black,backgroundColor:.white,font:UIFont(name:"Poppins-Light", size:32)!,cornerRadius:.init(h:80)/2)
        return thisButton
        
    }()
    
    let pressButton8:UIButton = {
        let thisButton = UIButton().button(title:"8" ,titleColor:.black,backgroundColor:.white,font:UIFont(name:"Poppins-Light", size:32)!,cornerRadius:.init(h:80)/2)
        return thisButton
        
    }()
    
    
    let pressButton9:UIButton = {
        let thisButton = UIButton().button(title:"9" ,titleColor:.black,backgroundColor:.white,font:UIFont(name:"Poppins-Light", size:32)!,cornerRadius:.init(h:80)/2)
        return thisButton
        
    }()
    
    
    
    let ButtonStackView4:UIStackView = {
        let thisPinStackView = UIStackView()
        thisPinStackView.axis = NSLayoutConstraint.Axis.horizontal
        thisPinStackView.distribution = .fillEqually
        //thisPinStackView.alignment = .fill
        thisPinStackView.spacing = .init(w:32)
        //thisPinStackView.backgroundColor = .green
        return thisPinStackView
    }()
    
    
    let pressButtonOK:UIButton = {
        let titlecolor = UIColor(hex:"#2EA7FF")
        let thisButton = UIButton().button(title:"0K",titleColor:titlecolor,font:UIFont(name:"Poppins-Regular", size:24)!)
        return thisButton
        
    }()
    
    
    let pressButton0:UIButton = {
        let thisButton = UIButton().button(title:"0" ,titleColor:.black,backgroundColor:.white,font:UIFont(name:"Poppins-Light", size:32)!,cornerRadius:.init(h:80)/2)
        return thisButton
        
    }()
    
    let pressButtonCross:UIButton = {
        let tintColor = UIColor(hex: "#838BA7")
        let image = UIImage(named: "tag-cross")
        let thisButton = UIButton().button(backgroundImage:image)
        thisButton.tintColor = tintColor
        return thisButton
        
    }()
    
    
    
    
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(hex:"#F2F3FA")
        view.backgroundColor = backgroundColor
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
        view.addSubview(ButtonStackView1)
        view.addSubview(ButtonStackView2)
        view.addSubview(ButtonStackView3)
        view.addSubview(ButtonStackView4)
        
        
        pinStackView.addArrangedSubview(stackButton)
        pinStackView.addArrangedSubview(stackButton2)
        pinStackView.addArrangedSubview(stackButton3)
        pinStackView.addArrangedSubview(stackButton4)
        pinStackView.addArrangedSubview(stackButton5)
        pinStackView.addArrangedSubview(stackButton6)
        
        ButtonStackView1.addArrangedSubview(pressButton1)
        ButtonStackView1.addArrangedSubview(pressButton2)
        ButtonStackView1.addArrangedSubview(pressButton3)
        
        
        
        ButtonStackView2.addArrangedSubview(pressButton4)
        ButtonStackView2.addArrangedSubview(pressButton5)
        ButtonStackView2.addArrangedSubview(pressButton6)
        
        
        
        ButtonStackView3.addArrangedSubview(pressButton7)
        ButtonStackView3.addArrangedSubview(pressButton8)
        ButtonStackView3.addArrangedSubview(pressButton9)
        
        
        
        ButtonStackView4.addArrangedSubview(pressButtonOK)
        ButtonStackView4.addArrangedSubview(pressButton0)
        ButtonStackView4.addArrangedSubview(pressButtonCross)
        
     
        
        
        
        
        
        
        
        
        pinTitle.anchorView(top: view.topAnchor,paddingTop:.init(h:66),width: UIdeviceSize.width - .init(w:173))
        pinTitle.centerX(inView:view)
        pinSubTitle.anchorView(top:pinTitle.bottomAnchor,paddingTop:.init(h:12),width:UIdeviceSize.width - .init(w:73))
        pinSubTitle.centerX(inView:view)
        pinStackView.anchorView(top:pinSubTitle.bottomAnchor,paddingTop: .init(h:108), width: .init(w: 156), height: .init(w:16))
        pinStackView.centerX(inView:view)
        
        //MARK: -
       
        ButtonStackView1.anchorView(top:pinStackView.bottomAnchor,paddingTop: .init(h:84), width: .init(w:304), height: .init(w:80))
        ButtonStackView1.centerX(inView:view)
        
        ButtonStackView2.anchorView(top:ButtonStackView1.bottomAnchor,paddingTop: .init(h:20), width: .init(w:304), height: .init(w:80))
        ButtonStackView2.centerX(inView:view)
        
        ButtonStackView3.anchorView(top:ButtonStackView2.bottomAnchor,paddingTop: .init(h:20), width: .init(w:304), height: .init(w:80))
        ButtonStackView3.centerX(inView:view)
        
        
        
        
        ButtonStackView4.anchorView(top:ButtonStackView3.bottomAnchor,paddingTop: .init(h:20), width: .init(w:304), height: .init(w:80))
        ButtonStackView4.centerX(inView:view)
        
        
        
        
    }
    
}

