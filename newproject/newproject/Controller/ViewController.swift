//
//  ViewController.swift
//  newproject
//
//  Created by New User on 7/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let networkImage:UIImageView = {
        let imageView = UIImage(named:"1")!
        let image = UIImageView()
        image.image = imageView
        return image
        
    }()
    
    let Slabel:UILabel = {
        let label = UILabel().label(title:"Strong Security", fontStyle:UIFont(name: "Poppins-SemiBold", size:24))
        return label
       
    }()
    
    let Plabel:UILabel = {
        let label = UILabel().label(title:"Protect your album with separate password for each album", fontStyle:UIFont(name:"Poppins-Regular", size:16))
        return label
       
    }()
    
    
    let roundButton:UIButton = {
        let hexColor = UIColor(hex:"#2EA7FF")
        let image = UIImage(named:"arrow-right")
        var button = UIButton().button(backgroundImage: image,backgroundColor:hexColor, cornerRadius:.init(h:68,for:68)/2, shadow:UIColor.blue.cgColor, shadowOpacity:0.5,shadowRadius:65)
        button.tintColor = .white
        return button
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
//        loadUI()
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
        
        view.addSubview(networkImage)
        view.addSubview(Slabel)
        view.addSubview(Plabel)
        view.addSubview(roundButton)
        
        
        networkImage.anchorView(top:view.topAnchor, paddingTop: .init(h:75),paddingLeft: .init(w:327),width: .init(w:414), height:.init(h:450,for:414))
        Slabel.anchorView(top:view.topAnchor,left: view.leftAnchor,paddingTop:.init(h:531), paddingLeft:.init(w:113),width:.init(w: 187), height: .init(h:24, for:187))
        Plabel.anchorView(top:view.topAnchor,left: view.leftAnchor,paddingTop:.init(h:567), paddingLeft:.init(w:32),width:.init(w:350), height: .init(h:39, for:350))
        roundButton.anchorView(top:view.topAnchor,left: view.leftAnchor,paddingTop:.init(h:758), paddingLeft:.init(w:172),width:.init(w:68), height: .init(h:68, for:68))

        
        
        
    
    }
    
    
}

