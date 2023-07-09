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
        let thisView = UIButton().button(title: "press here", backgroundColor: .red)
        return thisView
    }()
    
    let testlabel: UILabel = {
        let thisView = UILabel().label(title: "DipDutt", textColor: .black)
        return thisView
    }()
    
    let topButton:UIButton = {
        let thisView = UIButton().button(title:"press here2", backgroundColor: .green,cornerRadius:10)
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
        print(topButton.frame.size)
    }
    
    private func loadUI(){
        view.backgroundColor = .white
        view.addSubview(testlabel)
        view.addSubview(testButton)
        view.addSubview(topButton)
       
        testlabel.anchorView(top: view.topAnchor, left: view.leftAnchor, paddingTop:.init(h: 100), paddingLeft: .init(w:40), width: .init(w:200), height:.init(h:50, for: 200))
        testButton.anchorView(bottom: view.bottomAnchor, paddingBottom: .init(h:50), width: .init(w: 100), height: .init(h: 50, for: 100))
        testButton.centerX(inView:view)
        topButton.anchorView(top:view.topAnchor, left:testlabel.leftAnchor, paddingTop:.init(h:100), paddingLeft: .init(w:200), width:.init(w:100), height:.init(h:50,for:100))
    }
    
    
}

