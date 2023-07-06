//
//  ViewController.swift
//  newproject
//
//  Created by New User on 7/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    let testButton = UIButton()
    let testlabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        testlabel.text = "DipDutt"
        testButton.setTitle("press here", for: .normal)
        testButton.backgroundColor = .red
        view.addSubview(testlabel)
        view.addSubview(testButton)
       
        testlabel.anchorView(top: view.topAnchor,
                             left: view.leftAnchor,
                             paddingTop:.init(h: 100),
                             paddingLeft: .init(w:40),
                             width: .init(w:200),
                             height:.init(h:50, for: 200))
        
        testButton.anchorView(
            bottom: view.bottomAnchor,
            paddingBottom: .init(h:50),
            width: .init(w: 100),
            height: .init(h: 50, for: 100))
        testButton.centerX(inView:view)
    }
    
     override func viewDidAppear(_ animated: Bool) {
      print(testlabel.frame.size,testButton.frame.size)
    
        
    }


}

