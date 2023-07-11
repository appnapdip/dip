//
//  collectionView.swift
//  newproject
//
//  Created by New User on 7/10/23.
//

import UIKit

class collectionViewController:UIViewController {
    
    var onboardingmodels:[onBoardingModel] = []
    
    let collectioView: UICollectionView = {
        let thisLayout =  UICollectionViewFlowLayout()
        thisLayout.scrollDirection = .horizontal
        var thisCollection = UICollectionView(frame:.zero, collectionViewLayout:thisLayout)
        thisCollection.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        thisCollection.isPagingEnabled = true
        thisLayout.minimumLineSpacing = 0
        return thisCollection
    }()
    
    let nextButton:UIButton = {
        let hexColor = UIColor(hex:"#2EA7FF")
        let image = UIImage(named:"arrow-right")
        var thisButton = UIButton().button(backgroundImage: image,backgroundColor:hexColor, cornerRadius:.init(h:68,for:68)/2, shadow:UIColor.blue.cgColor, shadowOpacity:0.5,shadowRadius:65)
        thisButton.tintColor = .white
        return thisButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        onboardingmodels = onBoradingModelData()
    }
    
    
    private func loadUI(){
        view.addSubview(collectioView)
        collectioView.delegate = self
        collectioView.dataSource = self
        collectioView.anchorView(width:UIdeviceSize.width, height:UIdeviceSize.height)
        collectioView.centerY(inView:view)
        collectioView.centerX(inView:view)
        view.addSubview(nextButton)
        nextButton.anchorView(left: view.leftAnchor, bottom:view.bottomAnchor,paddingLeft:.init(w:172), paddingBottom:.init(h:70),width:.init(w:68), height: .init(h:68, for:68))
        
        //nextButton
        
    }
}

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

class CustomCell: UICollectionViewCell{
    
    let onboardingimageView = UIImageView()
    let onboardingTitle = UILabel().label(fontStyle:UIFont(name: "Poppins-SemiBold", size:24), allignment:.center)
    let onboardingSubTitle = UILabel().label(fontStyle:UIFont(name: "Poppins-Regular", size:16), allignment:.center)
    
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
        
        onboardingimageView.anchorView(top:topAnchor, paddingTop: .init(h:75),width: .init(w:414), height:.init(h:450,for:414))
        onboardingimageView.centerX(inView:contentView)
        onboardingTitle.anchorView(top:topAnchor,paddingTop:.init(h:531),width:.init(w:UIdeviceSize.width - .init(w:64)), height: .init(h:24, for:187))
        onboardingTitle.centerX(inView:contentView)
        onboardingSubTitle.anchorView(top:onboardingTitle.bottomAnchor, paddingTop:.init(h:12),width:.init(w:UIdeviceSize.width - .init(w:64)), height: .init(h:39, for:350))
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
