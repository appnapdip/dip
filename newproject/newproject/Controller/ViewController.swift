//
//  ViewController.swift
//  newproject
//
//  Created by New User on 7/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    let testButton: UIButton = {
        let thisView = UIButton().button(title: "press here", backgroundColor: .red,cornerRadius:10,shadow: UIColor.cyan.cgColor,shadowOpacity:1.0, shadowRadius:5)
        return thisView
    }()
    
    let testlabel: UILabel = {
        let thisView = UILabel().label(title: "DipDutt", textColor: .black,backgroundColor:.green)
        return thisView
    }()
    
   
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        print(testlabel.frame.size,testButton.frame.size)
        
    }
    
    private func loadUI(){
        view.backgroundColor = .white
        view.addSubview(testlabel)
        view.addSubview(testButton)
       
       
        testlabel.anchorView(top: view.topAnchor, left: view.leftAnchor, paddingTop:.init(h: 700), paddingLeft: .init(w:120), width: .init(w:150), height:.init(h:50, for: 200))
        testButton.anchorView(bottom: view.bottomAnchor, paddingBottom: .init(h:50), width: .init(w: 150), height: .init(h: 50, for: 150))
        testButton.centerX(inView:view)
    }
    
    
}

