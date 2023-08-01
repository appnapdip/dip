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
    var currentIndexAlbum = 0
    var isAlbumSeleted:Bool = true
    let reachability = try! Reachability()
    
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
        thisButton.addTarget(self, action:#selector(pressOnSettings), for: .touchUpInside)
        return thisButton
    }()
    
    lazy var albumsButton:UIButton = {
        let image = UIImage(named:"albums")
        var thisButton = UIButton().button(title:"Albums",titleColor:UIColor(hex:"#2EA7FF"),backgroundImage:image,titleEdgeInsetsLeft:.init(w:8),font:UIFont(name:"Poppins-Semibold", size:16)!)
        thisButton.tintColor = UIColor(hex:"#2EA7FF")
        thisButton.addTarget(self, action:#selector(pressAlbums), for: .touchUpInside)
        return thisButton
    }()
    
    lazy var itemsButton:UIButton = {
        let image = UIImage(named:"items-grid")
        var thisButton = UIButton().button(title:"Items",titleColor:UIColor(hex:"#838BA7"),backgroundImage:image,titleEdgeInsetsLeft:.init(w:8),font: UIFont(name:"Poppins-Semibold", size:16)!)
        thisButton.tintColor =  UIColor(hex:"#838BA7")
        thisButton.addTarget(self, action:#selector(pressItems), for: .touchUpInside)
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
        thisButton.addTarget(self, action: #selector(addAlbumPress), for:.touchUpInside)
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
        thisButton.addTarget(self, action: #selector(addItemPress), for: .touchUpInside)
        return thisButton
    }()
    
    lazy var AlbumUnderline:UIView = {
        let  thisView = UIView()
        thisView.backgroundColor = UIColor(hex: "#2EA7FF")
        thisView.isHidden = false
        return thisView
        
    }()
    
    
    lazy var itemsUnderline:UIView = {
        let  thisView = UIView()
        thisView.backgroundColor = UIColor(hex:"#2EA7FF")
        thisView.isHidden = true
        return thisView
        
    }()
    
    lazy var itemCollectionView: UICollectionView = {
        let thisLayout =  UICollectionViewFlowLayout()
        thisLayout.scrollDirection = .vertical
        var thisCollection = UICollectionView(frame:.zero, collectionViewLayout:thisLayout)
        thisCollection.showsVerticalScrollIndicator = false
        thisLayout.minimumLineSpacing = .init(h:UIDevice.current.userInterfaceIdiom == .pad ? .init(h:10) : .init(h:3))
        thisLayout.minimumInteritemSpacing = .init(w:0)
        thisCollection.backgroundColor = .clear
        thisCollection.isHidden = true
        thisCollection.register(itemImageCell.self, forCellWithReuseIdentifier: "ITCustomCell")
        return thisCollection
        
    }()
    
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColor = UIColor(hex:"#F2F3FA")
        view.backgroundColor = backgroundColor
        checkReachability()
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
    
    func showAlert(showSingleButton: Bool = true){
        if showSingleButton{
            let sAVC = self.singleButtonAlert(tittle: AlertMessage.inProgress.messageTitle,subTitle: AlertMessage.inProgress.messageSubTitle, firstButtonTitle: AlertMessage.inProgress.firstButtonTitle,firstButtonBackGrounColor:.clear) {
                
                if self.firstButton {
                    
                }else{
                    
                }
            }
            sAVC.delegate = self
            self.present(sAVC, animated: true)
        }else{
            let sAVC = self.doubleButtonAleart( tittle: AlertMessage.inProgress.messageTitle,subTitle: AlertMessage.inProgress.messageSubTitle, firstButtonTitle: AlertMessage.inProgress.firstButtonTitle,secondButtonTitle:AlertMessage.inProgress.secondButtonTitle,secondButtonBackGroundColor:.red) {
                if self.firstButton {
                    
                }else{
                    
                }
            }
            sAVC.delegate = self
            self.present(sAVC, animated: true)
        }
    }
    
    // MARK: - PRESS CANCEL/OK FUNCTION
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
        view.addSubview(AlbumUnderline)
        view.addSubview(itemsUnderline)
        mainScrollView.delegate = self
        mainScrollView.addSubview(addAlbumButton)
        headerView.addSubview(firstStackView)
        headerView.addSubview(secondStackView)
        mainScrollView.addSubview(buttonsCollectioView)
        mainScrollView.addSubview(albumsCollectioView)
        mainScrollView.addSubview(itemCollectionView)
        view.addSubview(addButton)
        
        buttonsCollectioView.delegate = self
        buttonsCollectioView.dataSource = self
        
        albumsCollectioView.delegate = self
        albumsCollectioView.dataSource = self
        
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        
        
        
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
        addAlbumButton.anchorView(top:mainScrollView.topAnchor,right:view.rightAnchor, paddingTop:.init(h:12),width: .init(h:44), height:.init(h:44))
        buttonsCollectioView.anchorView(top:mainScrollView.topAnchor,left:view.leftAnchor,right:addAlbumButton.leftAnchor, paddingTop:.init(h:12),height:.init(h:48))
        albumsCollectioView.anchorView(top:buttonsCollectioView.bottomAnchor,left:view.leftAnchor,bottom:view.bottomAnchor,right:view.rightAnchor,paddingTop:.init(h:28),paddingLeft: .init(w:16),paddingRight:.init(w:16))
        addButton.anchorView(bottom:view.bottomAnchor,paddingBottom:.init(h:46),width: .init(w:158), height: .init(h:56))
        addButton.centerX(inView:view)
        AlbumUnderline.anchorView(top:secondStackView.bottomAnchor,left:view.leftAnchor,paddingTop:.init(h:0), width:UIdeviceSize.width * 0.5, height:.init(h:1.5))
        itemsUnderline.anchorView(top:secondStackView.bottomAnchor,right:view.rightAnchor,paddingTop: .init(h:0),width:UIdeviceSize.width * 0.5, height:.init(h:1.5))
        itemCollectionView.anchorView(top:buttonsCollectioView.bottomAnchor,left:view.leftAnchor,bottom:view.bottomAnchor,right:view.rightAnchor,paddingTop:.init(h:28))
        
    }
    
    @objc func pressAlbums() {
        isAlbumSeleted = true
        currentIndexAlbum = 0
        currentIndexItem = 0
        buttonsCollectioView.reloadData()
        let albumsButtonImage =  UIImage(named:"album")
        albumsButton.setTitleColor(UIColor(hex:"#2EA7FF"), for:.normal)
        albumsButton.tintColor = UIColor(hex:"#2EA7FF")
        addAlbumButton.setImage(albumsButtonImage, for:.normal)
        itemsButton.setTitleColor(UIColor(hex:"#838BA7"), for:.normal)
        itemsButton.tintColor = UIColor(hex:"#838BA7")
        AlbumUnderline.isHidden = false
        itemsUnderline.isHidden = true
        itemCollectionView.isHidden = true
        albumsCollectioView.isHidden = false
        
        
    }
    
    @objc func pressItems() {
        isAlbumSeleted = false
        currentIndexItem = 0
        currentIndexAlbum = 0
        buttonsCollectioView.reloadData()
        let itemsButtonImage = UIImage(named:"images")
        
        itemsButton.setTitleColor(UIColor(hex:"#2EA7FF"), for:.normal)
        itemsButton.tintColor = UIColor(hex:"#2EA7FF")
        addAlbumButton.setImage(itemsButtonImage, for:.normal)
        addAlbumButton.tintColor = UIColor(hex:"#838BA7")
        albumsButton.setTitleColor(UIColor(hex:"#838BA7"), for:.normal)
        albumsButton.tintColor = UIColor(hex:"#838BA7")
        itemsUnderline.isHidden = false
        AlbumUnderline .isHidden = true
        
        itemCollectionView.isHidden = false
        albumsCollectioView.isHidden = true
        
        
    }
    
    @objc func pressOnSettings() {
        let svc = SettingsViewController()
        navigationController?.pushViewController(svc, animated:true)
    }
    
    //MARK:- checkReachability()
    private func checkReachability(){
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        }
        
        reachability.whenUnreachable = { _ in
            print("\(Self.self): Not reachable")
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                self.showToast(message: "No Internet Connection!",textColor:UIColor(hex:"#FF4D4D"))
                self.homeButton.setImage(UIImage(named:"Group 138"), for:.normal)
            })
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        
        do{
            try reachability.startNotifier()
            
        }catch{
            print("could not start reachability notifier")
        }
    }
    
    //MARK: - reachabilityChanged
    @objc func reachabilityChanged(note: Notification) {
        
        let reachability = note.object as! Reachability
        
        if reachability.connection != .unavailable{
            //icon change
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                self.showToast(message: "Internet Restored!",textColor:UIColor(hex:"#FF4D4D"))
                self.homeButton.setImage(UIImage(named:"cloud"), for:.normal)
            })
        }
    }
    
    @objc func  addItemPress() {
        showAlert(showSingleButton: false)
    }
    
    @objc  func addAlbumPress() {
        showAlert(showSingleButton: true)
    }
}


// MARK: - Button Catagories Extension

extension ViewController :  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - numbers of items
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == buttonsCollectioView {
            if isAlbumSeleted {
                return usermainDevice.allAlbumCategories.count // album catagorie count
            }
            return usermainDevice.itemCatagories.count // items catagorie count
        }
        
        else if collectionView == itemCollectionView {
            return  usermainDevice.itemCatagories[currentIndexItem].items.count
        }
        
        else {
            return usermainDevice.allAlbumCategories[currentIndexAlbum].albums.count // folders count
        }
        
    }
    
    
    
    
    //MARK: - Cell For Item
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == buttonsCollectioView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"VCCustomCell", for: indexPath) as! buttonsCustomCell
            cell.allcatagoriesTiltle.text = isAlbumSeleted ? usermainDevice.allAlbumCategories[indexPath.item].name : usermainDevice.itemCatagories[indexPath.item].name
            if indexPath.item == (isAlbumSeleted ? currentIndexAlbum : currentIndexItem)  {
                cell.backgroundColor = UIColor(hex:"#323336")
                cell.allcatagoriesTiltle.textColor = UIColor(hex:"#FFFFFF")
                
            }
            else {
                cell.backgroundColor = UIColor(hex:"#FFFFFF")
                cell.allcatagoriesTiltle.textColor = UIColor(hex:"#838BA7") // album catagorie and item catagorie data
                
            }
            return cell
        }
        
        else if collectionView == itemCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ITCustomCell", for:indexPath) as! itemImageCell
            cell.itemImageView.image = UIImage(named:usermainDevice.itemCatagories[currentIndexItem].items[indexPath.item].resource)
            return cell
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ACCustomCell", for: indexPath) as! albumsCustomCell
            let folderTypes = usermainDevice.allAlbumCategories[currentIndexAlbum].albums[indexPath.item]
            cell.albumsTitle.text = folderTypes.name
            cell.albumsizeTitle.text = folderTypes.size
            cell.albumIcon.text = folderTypes.icon // folders data
            return cell
        }
        
    }
    
    // MARK: - Size For Item
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == buttonsCollectioView {
            return CGSize(width: .init(w:96), height: .init(h:46))   // album and item cell size
        }
        else if collectionView == itemCollectionView {
            return CGSize(width: .init(w:136), height: .init(h:136,for:136))
        }
        else {
            return CGSize(width: .init(w:183), height: .init(h:140,for:183)) // folder cell size
        }
    }
    
    // MARK: - Edgeinsects Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == buttonsCollectioView {
            return UIEdgeInsets(top:.init(h:0), left:.init(w:16), bottom: .init(h:0), right: .init(w:0))  // album and item cell edege insects
        }
        
        else if collectionView == itemCollectionView {
            return UIEdgeInsets(top:.init(h:0), left:.init(w:0), bottom: .init(h:0), right: .init(w:0))
        }
        
        else {
            return UIEdgeInsets(top:.init(h:0), left:.init(w:0), bottom: .init(h:0), right: .init(w:0))  // folders cell edege insects
        }
    }
    
    // MARK: - SELECTION OF CELL
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // update the index of  button cell
        if collectionView == buttonsCollectioView {
            if isAlbumSeleted{
                currentIndexAlbum = indexPath.item
                print("select \(currentIndexAlbum)")
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                collectionView.reloadData()
                albumsCollectioView.reloadData()
                
            }else{
                currentIndexItem = indexPath.item
                print("select \(currentIndexItem)")
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                collectionView.reloadData()
                itemCollectionView.reloadData()
            }
            
            
        }
    }
}

// MARK: - Create Array Of Function

func albums() ->[Album] {
    let album1 = Album(id: "", icon: "📁", name: "Main Album", size:"\(200) items・\(200) mb", isLocked:false, items: [])
    let album2 = Album(id: "", icon: "🔒", name: "Locked Album", size:"Locked", isLocked:true, items: [])
    let album3 = Album(id: "", icon: "🗃", name: "Texts Limit 1 2 3 ...", size: "\(7.7)k items・(3.5) gb", isLocked:false, items: [])
    let album4 = Album(id: "", icon: "📁",name: "Empty Album", size:"Empty", isLocked:true, items: [])
    let album5 = Album(id: "", icon: "🗄", name: "Travel", size:"\(200) items・\(200) mb", isLocked:true, items: [])
    return [album1,album2,album3,album4,album5]
}

func Items() -> [Item] {
    let item1 = Item(id: "", name: "", type: "", Size: 0, resource: "Rectangle 10")
    let item2 = Item(id: "", name: "", type: "", Size: 0, resource: "Rectangle 10")
    let item3 = Item(id: "", name: "", type: "", Size: 0, resource: "Rectangle 10")
    let item4 = Item(id: "", name: "", type: "", Size: 0, resource: "Rectangle 10")
    return[item1,item2,item3,item4]
}






