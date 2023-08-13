//
//  SearchController.swift
//  newproject
//
//  Created by New User on 8/13/23.
//

import Foundation
import UIKit



class searchController:UIViewController, UISearchBarDelegate {
    
    // MARK: - backButton
    
    lazy var backButton: UIButton = {
        let thisButton = UIButton().button(backgroundImage: UIImage(systemName:"chevron.backward"))
        thisButton.tintColor = .black
        thisButton.addTarget(self, action: #selector(pressBackAction), for: .touchUpInside)
        return thisButton
    }()
    
    // MARK: - searchBar
    
    lazy var searchBar:UISearchBar = {
        let thisSearchBar = UISearchBar()
        thisSearchBar.layer.cornerRadius = .init(w:14)
        thisSearchBar.layer.borderColor = UIColor.black.cgColor
        thisSearchBar.layer.borderWidth = .init(w:1)
        thisSearchBar.searchTextField.backgroundColor = .white
        return thisSearchBar
    }()
    
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadUI()
        
    }
    
    // MARK: - loadUI()
    
    private func loadUI() {
        
        /// backButton
        view.addSubview(backButton)
        backButton.anchorView(top:view.topAnchor,left:view.leftAnchor, paddingTop: .init(h:100),width:.init(h:64),height: .init(h:64))
        
        /// searchBar
        view.addSubview(searchBar)
        searchBar.delegate =  self
        searchBar.anchorView(left:backButton.rightAnchor, width: .init(w:300))
        searchBar.centerY(inView:backButton)
    }
    
    // MARK: - pressBackAction to pop
    
    @objc func pressBackAction() {
        navigationController?.popToRootViewController(animated:true)
    }
    
}
