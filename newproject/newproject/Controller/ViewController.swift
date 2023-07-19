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
        thisLabel.tag = 0
        return thisLabel
        
    }()
    
    let pinSubTitle:UILabel = {
        let hexColor = UIColor(hex:"#5A5F73")
        let thisLabel = UILabel().label(title:"Create a PIN to lock your account", textColor:hexColor,fontStyle:UIFont(name: "Poppins-Regular", size:16),allignment:.center)
        thisLabel.tag = 1
        return thisLabel
    }()
    
    
    var pinviews:[UIView] = []
    
    var currentItem:Int = -1
    var currentPin:String  = ""
    
    
    //MARK: - StackItems
    
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
    
    
    let ButtonStackView2:UIStackView = {
        let thisPinStackView = UIStackView()
        thisPinStackView.axis = NSLayoutConstraint.Axis.horizontal
        thisPinStackView.distribution = .fillEqually
        //thisPinStackView.alignment = .fill
        thisPinStackView.spacing = .init(w:32)
        //thisPinStackView.backgroundColor = .green
        return thisPinStackView
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
    
    
    
    let ButtonStackView4:UIStackView = {
        let thisPinStackView = UIStackView()
        thisPinStackView.axis = NSLayoutConstraint.Axis.horizontal
        thisPinStackView.distribution = .fillEqually
        //thisPinStackView.alignment = .fill
        thisPinStackView.spacing = .init(w:32)
        //thisPinStackView.backgroundColor = .green
        return thisPinStackView
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
        
        [ButtonStackView1, ButtonStackView2, ButtonStackView3, ButtonStackView4].forEach { thisView in
            view.addSubview(thisView)
        }
        
        
        // MARK: - LOOP FOR UIVIEWS
        for i in 1...6 {
            let backgroundColor = UIColor(hex:"#D6D8E2")
            let PinView = UIView()
            PinView.tag = i
            PinView .backgroundColor = backgroundColor
            PinView .layer.cornerRadius = .init(w:16) / 2
            pinStackView.addArrangedSubview(PinView)
            pinviews.append(PinView)
            
        }
        
        //MARK: - PinTitleSubTilte and PinStackView Anchoring
        
        pinTitle.anchorView(top: view.topAnchor,paddingTop:.init(h:66),width: UIdeviceSize.width - .init(w:173))
        pinTitle.centerX(inView:view)
        pinSubTitle.anchorView(top:pinTitle.bottomAnchor,paddingTop:.init(h:12),width:UIdeviceSize.width - .init(w:73))
        pinSubTitle.centerX(inView:view)
        pinStackView.anchorView(top:pinSubTitle.bottomAnchor,paddingTop: .init(h:108), width: .init(w: 156), height: .init(w:16))
        pinStackView.centerX(inView:view)
        
        //MARK: - ButtonStacksAnchoring
        
        ButtonStackView1.anchorView(top:pinStackView.bottomAnchor,paddingTop: .init(h: .init(h:84)))
        ButtonStackView1.centerX(inView:view)
        
        ButtonStackView2.anchorView(top:ButtonStackView1.bottomAnchor,paddingTop: .init(h:.init(h:20)))
        ButtonStackView2.centerX(inView:view)
        
        ButtonStackView3.anchorView(top:ButtonStackView2.bottomAnchor,paddingTop: .init(h:.init(h:20)))
        ButtonStackView3.centerX(inView:view)
        
        ButtonStackView4.anchorView(top:ButtonStackView3.bottomAnchor,paddingTop: .init(h:.init(h:20)) )
        ButtonStackView4.centerX(inView:view)
        
        // MARK: - LOOP FOR Buttons
        for i in 1...12{
            lazy var thisButton = UIButton().button(title:"\(i)", titleColor:.black,backgroundColor:.white,font:UIFont(name:"Poppins-Light", size:32)!)
            thisButton.tag = i
            thisButton.addTarget(self, action: #selector(clickButtonAction(_:)), for: .touchUpInside)
            thisButton.anchorView(width: UIdeviceSize.width*0.19, height: UIdeviceSize.width*0.19)
            thisButton.layer.cornerRadius = UIdeviceSize.width*0.19/2
            
            if i < 4 && i > 0{ButtonStackView1.addArrangedSubview(thisButton)}
            if i < 7 && i > 3{ButtonStackView2.addArrangedSubview(thisButton)}
            if i < 10 && i > 6{ButtonStackView3.addArrangedSubview(thisButton)}
            if i > 9 {
                
                let title: String = i == 10 ? "OK" : i == 11 ? "0" : ""
                let image: UIImage? = i == 12 ? UIImage(named: "tag-cross") : nil
                let thisButton = UIButton().button(title:title,titleColor: i == 10 ? UIColor(hex:"#2EA7FF") : .black, backgroundImage: image, backgroundColor: i == 11 ? .white : .clear,font:UIFont(name:"Poppins-Light", size:32)!)
                if i == 10 {
                    thisButton.isUserInteractionEnabled = false
                    thisButton.alpha = 0
                }
                
                
                if i == 12 {thisButton.tintColor = .gray}
                thisButton.tag = i
                ButtonStackView4.addArrangedSubview(thisButton)
                thisButton.anchorView(width: UIdeviceSize.width*0.19, height: UIdeviceSize.width*0.19)
                thisButton.layer.cornerRadius = UIdeviceSize.width*0.19/2
                thisButton.addTarget(self, action: #selector(clickButtonAction(_:)), for: .touchUpInside)
                
            }
            
        }
        
        
    }
    
    //MARK: - Action Button Fuction
    
    @objc private func  clickButtonAction(_ sender: UIButton){
        
        switch sender.tag  {
        case 1,2,3,4,5,6,7,8,9,11:
            guard currentItem < 5 else {return}
            currentItem += 1
            currentPin.append("\(sender.tag == 11 ? 0 : sender.tag)")
            print(currentPin)
            pinviews[currentItem].backgroundColor = UIColor(hex:"#2EA7FF")
            
            
            if let okButton = ButtonStackView4.subviews.first(where: {$0.tag == 10}){
                okButton.isUserInteractionEnabled = currentItem > 4 ? true : false
                okButton.alpha = currentItem > 4 ? 1 : 0
            }
            
        case 12:
            guard currentItem > -1 else {return}
            pinviews[currentItem].backgroundColor = UIColor(hex:"#D6D8E2")
            currentItem -= 1
            
            print(currentItem)
            
            if let okButton = ButtonStackView4.subviews.first(where: {$0.tag == 10}){
                okButton.isUserInteractionEnabled = false
                okButton.alpha = 0
            }
            
        default:
            pinTitle.text = "Confirm Pin"
            pinSubTitle.text = "Re-enter PIN to confirm"
            
            
            // save pin user default and check pin correct or not
            
            
            for pinview in pinviews {
                pinview.backgroundColor = UIColor(hex:"#D6D8E2")
                
            }
            currentItem  = -1
            print(currentItem)
            
            if let okButton = ButtonStackView4.subviews.first(where: {$0.tag == 10}){
                okButton.isUserInteractionEnabled = currentItem < 0 ? false : true
                okButton.alpha = currentItem < 0 ? 0 : 1
            }
            
            
            
            
            if let PreviousPin = UserDefaults.standard.string(forKey:"savePin") {
                
                if PreviousPin == currentPin {
                    print("get the pin")
                }
                
                else {
                    pinSubTitle.text = "Incorrect PIN "
                    pinSubTitle.textColor = UIColor(hex:"#FF4D4D")
                    
                }
                
            } else {
                UserDefaults.standard.set(currentPin, forKey:"savePin")
                currentPin = ""
            }
            
            
            
            
            
            
            
            
            
            
        }
    }
    
}
