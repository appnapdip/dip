//
//  ViewController.swift
//  newproject
//
//  Created by New User on 7/6/23.
//

import UIKit

class ViewController: UIViewController,Onboarding,PinDismiss,RemoveAleartView {
    
    var firstButton: Bool = false
    //var buttonsCatagory:[Catagorie] = []
    var folders:[Album] = []
    var currentIndexItem = 0
    var currentIndex = 0
    
    // MARK: - Properties
    
    let headerView:UIView = {
        let thisView = UIView()
        thisView.backgroundColor = UIColor(hex:"#FFFFFF")
        return thisView
        
    }()
    
    lazy var firstStackView:UIStackView = {
        let thisStackView = UIStackView()
        thisStackView.axis = .horizontal
        thisStackView.distribution = .fill
        thisStackView.spacing = 0
        return thisStackView
        
    }()
    
    lazy var headerButtonsStack:UIStackView = {
        let thisStackView = UIStackView()
        thisStackView.axis = .horizontal
        thisStackView.distribution = .fillEqually
        thisStackView.spacing = 10
        thisStackView.anchorView(width: .init(w: 100))
        return thisStackView
    }()
    
    lazy var secondStackView:UIStackView = {
        let thisStackView = UIStackView()
        thisStackView.axis = .horizontal
        thisStackView.distribution = .fillEqually
        thisStackView.spacing = 0
        return thisStackView
    }()
    
    lazy var headerTitleView:UILabel = {
        let thislabel = UILabel().label(title:"Photo Vault",textColor:UIColor(hex:"#323336"),fontStyle:UIFont(name:"Poppins-SemiBold", size:.init(h:28)), allignment: .left)
        //thislabel.anchorView(width: .init(w: 165), height: .init(h: 42))
        return thislabel
    }()
    
    lazy var homeButton:UIButton = {
        let image = UIImage(named:"cloud")
        var thisButton = UIButton().button(backgroundImage:image,cornerRadius: .init(w:10))
        thisButton.tintColor = .black
        thisButton.layer.borderColor = UIColor(hex:"#D6D8E2").cgColor
        thisButton.layer.borderWidth = .init(h:1.0)
        return thisButton
    }()
    
    lazy var settingButton:UIButton = {
        let image = UIImage(named:"setting")
        var thisButton = UIButton().button(backgroundImage:image, cornerRadius:.init(w:10))
        thisButton.tintColor = .black
        thisButton.layer.borderColor = UIColor(hex:"#D6D8E2").cgColor
        thisButton.layer.borderWidth = .init(h:1.0)
        //thisButton.anchorView(width: .init(h: 42), height: .init(h: 42))
        return thisButton
    }()
    
    lazy var albumsButton:UIButton = {
        let image = UIImage(named:"albums")
        var thisButton = UIButton().button(title:"Albums",titleColor:UIColor(hex:"#2EA7FF"),backgroundImage:image,titleEdgeInsetsLeft:.init(w:8),font:UIFont(name:"Poppins-Semibold", size:16)!)
        thisButton.tintColor =  UIColor(hex:"#2EA7FF")
        return thisButton
    }()
    
    lazy var itemsButton:UIButton = {
        let image = UIImage(named:"items-grid")
        var thisButton = UIButton().button(title:"Items",titleColor:UIColor(hex:"#838BA7"),backgroundImage:image,titleEdgeInsetsLeft:.init(w:8),font: UIFont(name:"Poppins-Semibold", size:16)!)
        thisButton.tintColor = UIColor(hex:"#838BA7")
        //thisButton.anchorView(width: .init(h: 42), height: .init(h: 42))
        return thisButton
    }()
    
    lazy var mainScrollView: UIScrollView = {
        let thisScrollView = UIScrollView()
        thisScrollView.backgroundColor = UIColor(hex:"#D6D8E2")
        return thisScrollView
        
    }()
    
    
    lazy var addAlbumButton:UIButton = {
        let image = UIImage(named:"album")
        var thisButton = UIButton().button(backgroundImage:image)
        thisButton.tintColor = UIColor(hex:"#2EA7FF")
        return thisButton
    }()
    
    lazy var buttonsCollectioView: UICollectionView = {
        let thisLayout =  UICollectionViewFlowLayout()
        thisLayout.scrollDirection = .horizontal
        var thisCollection = UICollectionView(frame:.zero, collectionViewLayout:thisLayout)
        thisCollection.showsHorizontalScrollIndicator = false
        thisCollection.backgroundColor = .clear
        thisLayout.minimumLineSpacing = .init(h:12)
        thisLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        //thisLayout.minimumInteritemSpacing = 0
        thisCollection.register(buttonsCustomCell.self, forCellWithReuseIdentifier: "VCCustomCell")
        return thisCollection
    }()
    
    lazy var albumsCollectioView: UICollectionView = {
        let thisLayout =  UICollectionViewFlowLayout()
        thisLayout.scrollDirection = .vertical
        var thisCollection = UICollectionView(frame:.zero, collectionViewLayout:thisLayout)
        thisCollection.showsVerticalScrollIndicator = false
        thisLayout.minimumLineSpacing = .init(h:16)
        thisLayout.minimumInteritemSpacing = 0
        thisCollection.backgroundColor = .clear
        thisCollection.register(albumsCustomCell.self, forCellWithReuseIdentifier: "ACCustomCell")
        return thisCollection
    }()
    
    
    // MARK: - Add Buttons
    
    lazy var addButton:UIButton = {
        let image = UIImage(named:"add-circle")
        var thisButton = UIButton().button(title: "Add Items",titleColor:UIColor(hex:"#FFFFFF"),backgroundImage:image,backgroundColor:UIColor(hex:"#2EA7FF"), titleEdgeInsetsLeft: .init(w:10), font:UIFont(name:"Poppins-SemiBold", size:.init(h:16))!,cornerRadius: .init(w:16))
        thisButton.tintColor = .white
        thisButton.layer.shadowColor = UIColor(hex:"#294E5E").cgColor
        thisButton.layer.shadowRadius = .init(h:16)
        thisButton.layer.shadowOpacity = 0.5
        thisButton.layer.shadowRadius = CGFloat(h:.init(h:6))
        return thisButton
    }()
    
    // MARK: - viewDidLoad
    
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
    
    // MARK:  PINDISMISS FUNCTION
    
    func pinDismissCall() {
        dismiss(animated:true) {
            self.showToast(message: ToastMessage.welcome.description, font:UIFont(name:"Poppins-Medium", size:14)!)
            //self.showAlert()
            self.loadUI()
            //self.buttonsCatagory = self.catagorie()
            //self.folders = self.albums()
            
        }
        
    }
    
    // MARK: - ShowAleart Function
    
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
    
    // MARK: - UI Loading
    private func loadUI() {
        view.addSubview(headerView)
        view.addSubview(mainScrollView)
        mainScrollView.delegate = self
        mainScrollView.addSubview(addAlbumButton)
        headerView.addSubview(firstStackView)
        headerView.addSubview(secondStackView)
        mainScrollView.addSubview(buttonsCollectioView)
        mainScrollView.addSubview(albumsCollectioView)
        view.addSubview(addButton)
        
        buttonsCollectioView.delegate = self
        buttonsCollectioView.dataSource = self
        
        albumsCollectioView.delegate = self
        albumsCollectioView.dataSource = self
        
        headerView.anchorView(top: view.topAnchor, left:view.leftAnchor ,right:view.rightAnchor,height:.init(h:160))
        firstStackView.anchorView(top: headerView.topAnchor,left: headerView.leftAnchor, right: headerView.rightAnchor,paddingTop: .init(h:58), paddingLeft: .init(w: 16), paddingRight: .init(w: 16), height:.init(h:42))
        firstStackView.addArrangedSubview(headerTitleView)
        firstStackView.addArrangedSubview(headerButtonsStack)
        headerButtonsStack.addArrangedSubview(homeButton)
        headerButtonsStack.addArrangedSubview(settingButton)
        secondStackView.addArrangedSubview(albumsButton)
        secondStackView.addArrangedSubview(itemsButton)
        secondStackView.anchorView(left:headerView.leftAnchor,bottom: headerView.bottomAnchor, right:headerView.rightAnchor, height:.init(h:48))
        mainScrollView.anchorView(top:headerView.bottomAnchor,left:view.leftAnchor,bottom:view.bottomAnchor, right:view.rightAnchor)
        addAlbumButton.anchorView(top:mainScrollView.topAnchor,right:view.rightAnchor, paddingTop:.init(h:9),width: .init(h:44), height:.init(h:44))
        buttonsCollectioView.anchorView(top:mainScrollView.topAnchor,left:view.leftAnchor,right:addAlbumButton.leftAnchor, paddingTop:.init(h:12),height:.init(h:48))
        albumsCollectioView.anchorView(top:buttonsCollectioView.bottomAnchor,left:view.leftAnchor,bottom:view.bottomAnchor,right:view.rightAnchor,paddingTop:.init(h:28),paddingLeft: .init(w:16),paddingRight:.init(w:16))
        addButton.anchorView(bottom:view.bottomAnchor,paddingBottom:.init(h:46),width: .init(w:158), height: .init(h:56))
        addButton.centerX(inView:view)
        
    }
}


// MARK: - Button Catagories Extension

extension ViewController :  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - numbers of items
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == buttonsCollectioView {
            return usermainDevice.allAlbumCategories.count
        }
        
        else {
            return usermainDevice.allAlbumCategories[currentIndexItem].albums.count
        }
    }
    
    //MARK: - Cell For Item
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == buttonsCollectioView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"VCCustomCell", for: indexPath) as! buttonsCustomCell
            cell.allcatagoriesTiltle.text = usermainDevice.allAlbumCategories[indexPath.item].name
            if indexPath.item == currentIndexItem  {
                cell.backgroundColor = UIColor(hex:"#323336")
                cell.allcatagoriesTiltle.textColor = UIColor(hex:"#FFFFFF")
                
            }
            else {
                cell.backgroundColor = UIColor(hex:"#FFFFFF")
                cell.allcatagoriesTiltle.textColor = UIColor(hex:"#838BA7")
                
            }
            return cell
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ACCustomCell", for: indexPath) as! albumsCustomCell
            let folderTypes = usermainDevice.allAlbumCategories[currentIndexItem].albums[indexPath.item]
            cell.albumsTitle.text = folderTypes.name
            cell.albumsizeTitle.text = folderTypes.size
            cell.albumIcon.text = folderTypes.icon
            return cell
        }
    }
    
    // MARK: - Size For Item
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == buttonsCollectioView {
            return CGSize(width: .init(w:97), height: .init(h:36))
        }
        else {
            return CGSize(width: .init(w:183), height: .init(h:140))
        }
    }
    
    // MARK: - Edgeinsects Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == buttonsCollectioView {
            return UIEdgeInsets(top:.init(h:0), left:.init(w:16), bottom: .init(h:0), right: .init(w:0))
        }
        
        else {
            return UIEdgeInsets(top:.init(h:0), left:.init(w:0), bottom: .init(h:0), right: .init(w:0))
        }
    }
    
    // MARK: - SELECTION OF CELL
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == buttonsCollectioView {
            currentIndexItem = indexPath.item
            print("select \(currentIndexItem)")
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionView.reloadData()
            albumsCollectioView.reloadData()
            
        }
    }
}

// MARK: - BUTTONS CUSTOM CELL

class buttonsCustomCell: UICollectionViewCell{
    let allcatagoriesTiltle = UILabel().label(textColor:UIColor(hex:"#838BA7"),lines: 1 ,fontStyle:UIFont(name: "Poopins- Regular", size: .init(h:14)))
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        contentView.addSubview(allcatagoriesTiltle)
        backgroundColor = UIColor(hex: "#FFFFFF")
        layer.cornerRadius = .init(h:12)
        layer.borderColor = UIColor(hex:"#D6D8E2").cgColor
        layer.borderWidth = .init(h:0.5)
        loadUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ButtonscustomCell LoadUI
    
    private func loadUI() {
        allcatagoriesTiltle.anchorView(top:topAnchor,left:leftAnchor,bottom:bottomAnchor,right:rightAnchor,paddingTop:.init(h:12),paddingLeft: .init(h:16),paddingBottom:.init(h:16),paddingRight:.init(w:16))
        contentView.anchorView(width:UIdeviceSize.width)
    }
}

// MARK: - ALBUMS CUSTOM CELL

class albumsCustomCell: UICollectionViewCell{
    
    let albumsTitle = UILabel().label(textColor: UIColor(hex:"#323336"),fontStyle:UIFont(name: "Poppins-Medium", size:.init(h:16)),allignment:.left)
    let albumsImage = UIImageView().Image(contantMode:.scaleAspectFit)
    let albumsizeTitle = UILabel().label(textColor: UIColor(hex:"#838BA7"),fontStyle:UIFont(name: "Poppins-Regular", size:.init(h:14)),allignment:.left)
    let albumIcon = UILabel().label(fontStyle:UIFont(name: "Poppins-Medium", size:.init(h:28)),allignment:.left)
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        contentView.addSubview(albumsImage)
        albumsImage.addSubview(albumIcon)
        albumsImage.addSubview(albumsTitle)
        albumsImage.addSubview(albumsizeTitle)
        
        albumsImage.image = UIImage(named:"Vector")
        loadUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - AlbumCustomCell LoadUI
    
    private func loadUI() {
        albumsImage.anchorView(top:topAnchor,left:leftAnchor,bottom:bottomAnchor,right:rightAnchor)
        albumIcon.anchorView(top:albumsImage.topAnchor,left:albumsImage.leftAnchor,paddingTop:.init(h:20),paddingLeft:.init(w:22))
        albumsTitle.anchorView(top:albumIcon.bottomAnchor,left:albumsImage.leftAnchor,paddingTop:.init(h:20),paddingLeft:.init(w:22))
        albumsizeTitle.anchorView(left:albumsImage.leftAnchor,bottom:albumsImage.bottomAnchor,paddingLeft:.init(w:22),paddingBottom:.init(h:16))
        
    }
    
}

// MARK: - Create Extension

    
    // MARK: - Create Array Of Function
    
    func albums() ->[Album] {
        let album1 = Album(id: "", icon: "📁", name: "Main Album", size:"\(200) items・\(200) mb", isLocked:false, items: [])
        let album2 = Album(id: "", icon: "🔒", name: "Locked Album", size:"Locked", isLocked:true, items: [])
        let album3 = Album(id: "", icon: "🗃", name: "Texts Limit 1 2 3 ...", size: "\(7.7)k items・(3.5) gb", isLocked:false, items: [])
        let album4 = Album(id: "", icon: "📁",name: "Empty Album", size:"Empty", isLocked:true, items: [])
        let album5 = Album(id: "", icon: "🗄", name: "Travel", size:"\(200) items・\(200) mb", isLocked:true, items: [])
        return [album1,album2,album3,album4,album5]
    }
    
    








