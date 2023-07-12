//
//  collectionView.swift
//  newproject
//
//  Created by New User on 7/10/23.
//

import UIKit

class collectionViewController:UIViewController {
    
    // MARK: - creating properties
    
    var onboardingmodels:[onBoardingModel] = []
    var currentcell = 0
    
    // MARK: - creating collectionview
    let collectioView: UICollectionView = {
        let thisLayout =  UICollectionViewFlowLayout()
        thisLayout.scrollDirection = .horizontal
        var thisCollection = UICollectionView(frame:.zero, collectionViewLayout:thisLayout)
        thisCollection.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        thisCollection.isPagingEnabled = true
        thisLayout.minimumLineSpacing = 0
        return thisCollection
    }()
    // MARK: - creating nextButton
    lazy var nextButton:UIButton = {
        let hexColor = UIColor(hex:"#2EA7FF")
        let image = UIImage(named:"arrow-right")
        var thisButton = UIButton().button(backgroundImage: image,backgroundColor:hexColor, cornerRadius:.init(h:68,for:68)/2, shadow:UIColor.blue.cgColor, shadowOpacity:0.5,shadowRadius:65)
        thisButton.tintColor = .white
        thisButton.addTarget(self, action:#selector(press(_:)), for:.touchUpInside)
        return thisButton
    }()
    // MARK: - creating skipButton
    lazy var skipButton:UIButton = {
        let hexColor = UIColor(hex:"#323336")
        var thisButton = UIButton().button(title:"Skip",titleColor:.black,font: UIFont(name:"Poppins-Regular", size: 16)!)
        thisButton.addTarget(self, action:#selector(skippress), for:.touchUpInside)
        return thisButton
    }()
    
    // MARK: - creating UIPagecontroll
    lazy var onboradinpageControll:UIPageControl = {
        let thispagecontrol = UIPageControl()
        let hexColor = UIColor(hex:"#D6D8E2")
        thispagecontrol.currentPageIndicatorTintColor = .black
        thispagecontrol.pageIndicatorTintColor = hexColor
        thispagecontrol.numberOfPages = 5
        thispagecontrol.addTarget(self, action:#selector(changepage), for: .valueChanged)
        return thispagecontrol
        
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        onboardingmodels = onBoradingModelData()
    }
    
    // MARK: - creating uiload function
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
    // MARK: - creating page changebutton v
    @objc func changepage(_ sender:UIPageControl) {
        currentcell = sender.currentPage
        collectioView.scrollToItem(at: [0, currentcell], at: .centeredHorizontally, animated: true)
        
    }
    // MARK: - create pressbutton fuction
    @objc func press(_ button: UIButton) {
        currentcell += 1
        if currentcell > 4 {
            dismiss(animated: true) {
                UserDefaults.standard.set(true, forKey:"onboardingShown")
            }
        }else {
            collectioView.scrollToItem(at: [0, currentcell], at: .centeredHorizontally, animated: true)
        }
    }
    // MARK: - create skipbuton fuction
    @objc func skippress() {
        dismiss(animated: true) {
            UserDefaults.standard.set(true, forKey:"onboardingShown")
        }
        
    }
}

// MARK: create extension of collectionViewController

extension collectionViewController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingmodels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"CustomCell", for: indexPath) as! CustomCell
        let onboadingModel = onboardingmodels[indexPath.item]
        cell.onboardingimageView.image = onboadingModel.onboardingImage
        cell.onboardingTitle.text = onboadingModel.onboardingText
        cell.onboardingSubTitle.text = onboadingModel.onboradingSubTitle
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:UIdeviceSize.width, height:UIdeviceSize.height)
    }
    
}
// MARK: - create customcell
class CustomCell: UICollectionViewCell{
    
    let onboardingimageView = UIImageView()
    let onboardingTitle = UILabel().label(lines: 1, fontStyle:UIFont(name: "Poppins-SemiBold", size:24), allignment:.center)
    let onboardingSubTitle = UILabel().label(lines: 2, fontStyle:UIFont(name: "Poppins-Regular", size:16), allignment:.center)
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        loadonboradingUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadonboradingUI() {
        contentView.addSubview(onboardingimageView)
        contentView.addSubview(onboardingTitle)
        contentView.addSubview(onboardingSubTitle)
        
        onboardingimageView.contentMode = .scaleAspectFill
        onboardingimageView.anchorView(top:topAnchor,paddingTop:.init(h:UIdeviceSize.width < 376 ? 32 : 75),width:UIdeviceSize.width)
        onboardingimageView.centerX(inView:contentView)
        onboardingTitle.anchorView(bottom:bottomAnchor, paddingBottom: .init(h:UIdeviceSize.width < 376 ? 300 : 341), width:.init(w:UIdeviceSize.width - .init(w:64)))
        onboardingTitle.centerX(inView:contentView)
        onboardingSubTitle.anchorView(top:onboardingTitle.bottomAnchor, paddingTop:.init(h:12),width:.init(w:UIdeviceSize.width - .init(w:64)))
        onboardingSubTitle.centerX(inView: contentView)
    }
}




extension collectionViewController {
    
    func onBoradingModelData()->[onBoardingModel] {
        
        let  onboading1 = onBoardingModel(onboardingImage: UIImage(named:"1")!, onboardingText: "Strong Security", onboradingSubTitle: "Protect your album with separate password\nfor each album")
        let onboading2 = onBoardingModel(onboardingImage:UIImage(named: "2")!, onboardingText: "Secure Cloud Storage", onboradingSubTitle:"Protect your album with separate password\nfor each album")
        let onboarding3 = onBoardingModel(onboardingImage: UIImage(named: "3")!, onboardingText: "Intruder Alerts", onboradingSubTitle: "Snap a secret photo and record the time & incorrect PIN attempts by would-be intruders")
        let onboading4 = onBoardingModel(onboardingImage: UIImage(named: "4")!, onboardingText: "Decoy Vault", onboradingSubTitle: "Create a second PIN that opens to decoy\nphoto vault with its own albums and content.")
        let onboarding5 = onBoardingModel(onboardingImage: UIImage(named: "5")!, onboardingText: "Password Proceted Album", onboradingSubTitle: "Protect your album with separate password\nfor each album")
        return [onboading1,onboading2,onboarding3,onboading4,onboarding5]
    }
}
