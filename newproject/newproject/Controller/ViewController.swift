//
//  ViewController.swift
//  newproject
//
//  Created by New User on 7/6/23.
//

import UIKit

class ViewController: UIViewController,Onboarding,PinDismiss,RemoveAleartView {
    //MARK: - viewDidLoad
    var firstButton: Bool = false
    
    // MARK: - Properties
    
    let headerView:UIView = {
        let thisView = UIView()
        return thisView
        
    }()
    
    
    let firstStackView:UIStackView = {
        
        let thisStackView = UIStackView()
        thisStackView.axis = NSLayoutConstraint.Axis.horizontal
        thisStackView.distribution = .fillProportionally
        return thisStackView
        
    }()
    
    
    let secondStackView:UIStackView = {
        let thisStackView = UIStackView()
        thisStackView.axis = NSLayoutConstraint.Axis.horizontal
        thisStackView.backgroundColor = .orange
        return thisStackView
    }()
    
    
    let headerTitleView:UILabel = {
        let thislabel = UILabel().label(title:"Photo Vault",textColor:UIColor(hex:"#323336"),fontStyle:UIFont(name:"Poppins-SemiBold", size:.init(h:28)))
        return thislabel
    }()
    
    
    lazy var homeButton:UIButton = {
        let hexColor = UIColor(hex:"#323336")
        let image = UIImage(named:"home")
        var thisButton = UIButton().button(backgroundImage:image)
        thisButton.tintColor = .black
         return thisButton
    }()
    
    // MARK: - creating skipButton
    lazy var settingButton:UIButton = {
        let image = UIImage(named:"setting")
        var thisButton = UIButton().button(backgroundImage:image)
        thisButton.tintColor = .black
        return thisButton
    }()
    
    
  
    
  
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(hex:"#F2F3FA")
        view.backgroundColor = backgroundColor
        DispatchQueue.main.async {
            self.checkOnboardingAndPin()
        }
        
        
    }
    
    
    // MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
    }
    
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    // MARK: - Protocol Function
    
    func OnboradingdismissCall() {
        dismiss(animated: true) {
            UserDefaults.standard.set(true, forKey:ONBOARDING_SHOWN_KEY)
            let pin = PinViewController()
            pin.delegate = self
            pin.modalPresentationStyle = .fullScreen
            pin.modalTransitionStyle = .crossDissolve
            self.present(pin, animated:true)
        }
    }
    
    
    func pinDismissCall() {
        dismiss(animated:true) {
            self.showToast(message: ToastMessage.welcome.description, font:UIFont(name:"Poppins-Medium", size:14)!)
            //self.showAlert()
            self.loadUI()
            
        }
        
    }
    
    func showAlert(){
        let sAVC = self.singleButtonAlert(subTitle: AlertMessage.welcome.messageSubTitle, firstButtonTitle: AlertMessage.welcome.firstButtonTitle) {
            
            if self.firstButton {
                
            }else{
                
            }
        }
        sAVC.delegate = self
        self.present(sAVC, animated: true)
    }
    
    // MARK: - PRESS CANCEL FUNCTION
    func pressAction(firstButton: Bool) {
        self.firstButton = firstButton
    }
    
    
    //MARK: - Function CheckOanboarding and EnterPin
    
    func checkOnboardingAndPin(){
        if !UserDefaults.standard.bool(forKey:ONBOARDING_SHOWN_KEY) {
            let vc = collectionViewController()
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
        
        else {
            let vc = PinViewController()
            vc.delegate = self
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            vc.pinTitle.text = "Enter PIN"
            vc.pinSubTitle.text = "Please enter your 6 digit PIN"
            self.present(vc, animated:true)
        }
    }
    
    private func loadUI() {
        view.addSubview(headerView)
        headerView.addSubview(firstStackView)
        headerView.addSubview(secondStackView)
        firstStackView.addArrangedSubview(headerTitleView)
        firstStackView.addArrangedSubview(homeButton)
        firstStackView.addArrangedSubview(settingButton)
        
        headerView.anchorView(left:view.leftAnchor ,right:view.rightAnchor,paddingLeft:.init(w:0), paddingRight:.init(w:0),height:.init(h:160))
        firstStackView.anchorView(top: headerView.topAnchor,left: headerView.leftAnchor,right: headerView.rightAnchor,paddingTop: .init(h:58),paddingLeft: .init(w:16),paddingRight: .init(w:14),height:.init(h:42))
        secondStackView.anchorView(left:headerView.leftAnchor,bottom: headerView.bottomAnchor, right:headerView.rightAnchor, height:.init(h:48))
        
        
    }
    
}


