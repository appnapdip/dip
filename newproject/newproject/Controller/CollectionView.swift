//
//  collectionView.swift
//  newproject
//
//  Created by New User on 7/10/23.
//

import UIKit

// MARK: - Onboarding Page


protocol Onboarding {
    func OnboradingdismissCall()
}

class collectionViewController: UIViewController {
    
    // MARK: - creating properties
    
    var onboardingmodels:[onBoardingModel] = []
    var currentcell = 0
    var delegate:Onboarding?
    
    //  creating collectionview
    let collectioView: UICollectionView = {
        let thisLayout =  UICollectionViewFlowLayout()
        thisLayout.scrollDirection = .horizontal
        var thisCollection = UICollectionView(frame:.zero, collectionViewLayout:thisLayout)
        thisCollection.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        thisCollection.isPagingEnabled = true
        thisLayout.minimumLineSpacing = 0
        return thisCollection
    }()
    
    //  creating nextButton
    lazy var nextButton:UIButton = {
        let hexColor = UIColor(hex:"#2EA7FF")
        let image = UIImage(named:"arrow-right")
        var thisButton = UIButton().button(backgroundImage:image,backgroundColor:hexColor,cornerRadius:.init(h:68,for:68)/2,shadow:UIColor.blue.cgColor,shadowOpacity:0.5,shadowRadius:65)
        thisButton.tintColor = .white
        thisButton.addTarget(self, action:#selector(press(_:)), for:.touchUpInside)
        return thisButton
    }()
    
    //  creating skipButton
    lazy var skipButton:UIButton = {
        let hexColor = UIColor(hex:"#323336")
        var thisButton = UIButton().button(title:"Skip",titleColor:.black,font: UIFont(name:"Poppins-Regular", size: 16)!)
        thisButton.addTarget(self, action:#selector(skippress), for:.touchUpInside)
        return thisButton
    }()
    
    //  creating UIPagecontroll
    lazy var onboradinpageControll:UIPageControl = {
        let thispagecontrol = UIPageControl()
        let hexColor = UIColor(hex:"#D6D8E2")
        thispagecontrol.currentPageIndicatorTintColor = .black
        thispagecontrol.pageIndicatorTintColor = hexColor
        thispagecontrol.numberOfPages = 5
        thispagecontrol.addTarget(self, action:#selector(changepage(_:)), for: .valueChanged)
        return thispagecontrol
        
    }()
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        onboardingmodels = onBoradingModelData()
    }
    
    // MARK: - creating loadUI function
    
    private func loadUI(){
        view.addSubview(collectioView)
        collectioView.delegate = self
        collectioView.dataSource = self
        collectioView.anchorView(width:UIdeviceSize.width, height:UIdeviceSize.height)
        collectioView.centerY(inView:view)
        collectioView.centerX(inView:view)
        view.addSubview(nextButton)
        view.addSubview(skipButton)
        view.addSubview(onboradinpageControll)
        nextButton.anchorView(bottom:view.bottomAnchor, paddingBottom:.init(h:70),width:.init(w:68), height: .init(h:68, for:68))
        nextButton.centerX(inView: view)
        skipButton.anchorView(top:view.topAnchor,right:view.rightAnchor, paddingTop:.init(h:72), paddingRight: .init(w:8), width: UIdeviceSize.width*0.145)
        onboradinpageControll.anchorView(bottom:nextButton.topAnchor,paddingBottom:.init(h:54))
        onboradinpageControll.centerX(inView:view)
    }
    
    // MARK: - creating page changebutton
    
    @objc func changepage(_ pageControl: UIPageControl) {
        print("changebutton \(pageControl.currentPage)")
        currentcell = pageControl.currentPage
        collectioView.scrollToItem(at: [0, currentcell], at: .centeredHorizontally, animated: true)
        
    }
    
    // MARK: - create pressbutton fuction to scrollling the cell
    
    @objc func press(_ button: UIButton) {
        currentcell += 1
        if currentcell > 4 {
            delegate?.OnboradingdismissCall()
        }else {
            onboradinpageControll.currentPage = currentcell
            print("press button \(currentcell)")
            collectioView.scrollToItem(at: [0, currentcell], at: .centeredHorizontally, animated: true)
        }
    }
    
    // MARK: - create skipbuton fuction
    
    @objc func skippress() {
        delegate?.OnboradingdismissCall()
    }
}








