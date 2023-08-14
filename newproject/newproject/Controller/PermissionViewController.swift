//
//  PermissionViewController.swift
//  newproject
//
//  Created by New User on 8/5/23.
//

import Foundation
import UIKit
import Photos
import CoreLocation
import EventKit
import UserNotifications
import CoreMotion


// MARK: - Permission Page to get permission

class PerMissionViewController:UIViewController, UIScrollViewDelegate,RemoveAleartView, CLLocationManagerDelegate {
    
    func pressAction(firstButton: Bool) {
        self.firstButton = firstButton
    }
    
    
    // MARK: - Properties
    
    var firstButton:Bool = true
    
    //  eventStore property
    
    let eventStore = EKEventStore()
    
    
    // perdometer property
    
    let pedometer = CMPedometer()
    var permissionButtons: [UIButton] = []
    
    //  isPedometerAvailable
    
    private var isPedometerAvailable: Bool {
        return CMPedometer.isPedometerEventTrackingAvailable() && CMPedometer.isDistanceAvailable() && CMPedometer.isStepCountingAvailable()
    }
    
    //  - permissionscrollView
    
    lazy var permissionscrollView: UIScrollView = {
        let thisScrollView = UIScrollView()
        thisScrollView.showsVerticalScrollIndicator = false
        thisScrollView.showsHorizontalScrollIndicator = false
        thisScrollView.contentSize.height = .init(h:950)
        thisScrollView.isScrollEnabled = true
        view.backgroundColor = .white
        return thisScrollView
    }()
    
    //  permissionTitle
    
    var permissionTitle:UILabel = {
        let hexColor = UIColor(hex:"#000000")
        let thisLabel = UILabel().label(title:"Permission", textColor:hexColor,lines:1,fontStyle:UIFont(name: "Poppins-Regular", size:28),allignment:.center)
        return thisLabel
        
    }()
    
    //  permissionSubTitle
    
    var permissionSubTitle:UILabel = {
        let hexColor = UIColor(hex:"#5A5F73")
        let thisLabel = UILabel().label(title:"Widgethub Needs Your Permission to Fuction Properly.\nYou can change it anytime from Settings.", textColor:hexColor,lines: 2 ,fontStyle:UIFont(name: "Poppins-Regular", size:16),allignment:.center)
        return thisLabel
    }()
    
    //  permissionGroupImage
    
    var permissionGroupImage:UIImageView = {
        let thisImage = UIImageView().Image(contantMode:.scaleAspectFit)
        thisImage.image = UIImage(named:"permissionGroupImage")
        return thisImage
        
    }()
    
    //  finishButton
    
    lazy var finishButton:UIButton = {
        let thisButton = UIButton().button(title:"Finish", titleColor:UIColor(hex:"#FFFFFF"), cornerRadius: .init(w:16))
        thisButton.backgroundColor = .orange.withAlphaComponent(.init(h:1))
        thisButton.addTarget(self, action: #selector(pressFinish), for: .touchUpInside)
        return thisButton
    }()
    
    //  crossButton
    
    lazy var crossButton:UIButton = {
        let thisButton = UIButton().button(backgroundImage:UIImage(systemName:"multiply"))
        thisButton.tintColor = .black
        thisButton.addTarget(self, action:#selector(presscross), for:.touchUpInside)
        return thisButton
        
    }()
    
    //   shadowView
    
    let shadowView:UIView = {
        let thisShadowView = UIView()
        return thisShadowView
    }()
    
    //  mainStackView
    
    let mainStackView:UIStackView = {
        let thisStackView = UIStackView()
        thisStackView.axis = .vertical
        thisStackView.spacing = .init(h:40)
        thisStackView.distribution = .fillEqually
        return thisStackView
        
    }()
    
    // MARK: - PermissionModel Array
    
    let permissions:[PermissionModel] = [PermissionModel(title:"Photo Usage", subtitle:"Permission to access the photo usage", image: "photos"),
                                         PermissionModel(title:"Location", subtitle:"Permission to access the device location", image:"signs"),
                                         PermissionModel(title:"Calender", subtitle:"Permission to access the caldender events", image:"calendar"),    PermissionModel(title:"Notification", subtitle:"Permission to access the user notification", image:"notification"),
                                         PermissionModel(title:"Motion & Fitness", subtitle:"Permission to access the motion data and fitness", image:"signs"),
    ]
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    // MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        checkPermissions()
    }
    
    // MARK: - viewDidLayoutSubviews()
    
    override func viewDidLayoutSubviews() {
        showGradient()
        
    }
    
    // MARK: - checkPermissions() for UI update change when navigate
    
    private func checkPermissions(){
        ///photo
        if PHPhotoLibrary.authorizationStatus(for: .readWrite) == .authorized{
            toggleUI(id: 0)
        }
        
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            toggleUI(id:1)
        }
        
        if EKEventStore.authorizationStatus(for:.event) == .authorized {
            toggleUI(id:2)
        }
        
        
        if CMPedometer.authorizationStatus() == .authorized {
            toggleUI(id:4)
        }
        
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async { [self] in
                if settings.authorizationStatus == .authorized  {
                    toggleUI(id:3)
                }
            }
        }
    }
    
    // MARK: -  toggleUI for change UI of Permissions Buttons
    
    func toggleUI(id: Int){
        switch id{
        case 0:
            DispatchQueue.main.async {
                let sender = self.permissionButtons[0]
                sender.setImage(UIImage(systemName:"checkmark"), for:.normal)
                sender.tintColor = UIColor(hex:"#FFFFFF")
                sender.setTitleColor(.clear, for:.normal)
                sender.imageEdgeInsets = .init(top:0, left:16, bottom: 0, right: 0)
                sender.backgroundColor = .orange
                sender.layer.borderWidth = 0
            }
        case 1:
            DispatchQueue.main.async {
                let sender = self.permissionButtons[1]
                sender.setImage(UIImage(systemName:"checkmark"), for:.normal)
                sender.tintColor = UIColor(hex:"#FFFFFF")
                sender.setTitleColor(.clear, for:.normal)
                sender.imageEdgeInsets = .init(top:0, left:16, bottom: 0, right: 0)
                sender.backgroundColor = .orange
                sender.layer.borderWidth = 0
            }
            
        case 2:
            DispatchQueue.main.async {
                let sender = self.permissionButtons[2]
                sender.setImage(UIImage(systemName:"checkmark"), for:.normal)
                sender.tintColor = UIColor(hex:"#FFFFFF")
                sender.setTitleColor(.clear, for:.normal)
                sender.imageEdgeInsets = .init(top:0, left:16, bottom: 0, right: 0)
                sender.backgroundColor = .orange
                sender.layer.borderWidth = 0
            }
            
        case 3:
            
            DispatchQueue.main.async {
                let sender = self.permissionButtons[3]
                sender.setImage(UIImage(systemName:"checkmark"), for:.normal)
                sender.tintColor = UIColor(hex:"#FFFFFF")
                sender.setTitleColor(.clear, for:.normal)
                sender.imageEdgeInsets = .init(top:0, left:16, bottom: 0, right: 0)
                sender.backgroundColor = .orange
                sender.layer.borderWidth = 0
            }
        case 4:
            DispatchQueue.main.async {
                let sender = self.permissionButtons[0]
                sender.setImage(UIImage(systemName:"checkmark"), for:.normal)
                sender.tintColor = UIColor(hex:"#FFFFFF")
                sender.setTitleColor(.clear, for:.normal)
                sender.imageEdgeInsets = .init(top:0, left:16, bottom: 0, right: 0)
                sender.backgroundColor = .orange
                sender.layer.borderWidth = 0
            }
            
        default:
            break
        }
    }
    
    // MARK: - loadUI()
    
    private func loadUI() {
        
        ///scrollview
        view.addSubview(permissionscrollView)
        permissionscrollView.delegate = self
        permissionscrollView.anchorView(top:view.topAnchor,left:view.leftAnchor,bottom: view.bottomAnchor,right:view.rightAnchor)
        
        ///permissionTitle
        permissionscrollView.addSubview(permissionTitle)
        permissionTitle.anchorView(top: permissionscrollView.topAnchor, paddingTop:.init(h:0),width:.init(w:152),height: .init(h:46))
        permissionTitle.centerX(inView:view)
        
        ///permissionSubTitle
        permissionscrollView.addSubview(permissionSubTitle)
        permissionSubTitle.anchorView(top:permissionTitle.bottomAnchor,paddingTop:.init(h:8),width: .init(w:332),height: .init(h:40))
        permissionSubTitle.centerX(inView:view)
        
        ///permissionGroupImage
        permissionscrollView.addSubview(permissionGroupImage)
        permissionGroupImage.anchorView(top:permissionSubTitle.bottomAnchor,paddingTop: .init(h:33),width: .init(w:330), height: .init(h:240))
        permissionGroupImage.centerX(inView:view)
        
        ///mainStackView
        permissionscrollView.addSubview(mainStackView)
        mainStackView.anchorView(top:permissionGroupImage.bottomAnchor, left:view.leftAnchor, right: view.rightAnchor,paddingTop:.init(h:60),paddingLeft: .init(w:30), paddingRight: .init(w:30))
        
        ///shadowview
        view.addSubview(shadowView)
        shadowView.anchorView(left:view.leftAnchor, bottom:view.bottomAnchor, right:view.rightAnchor,height: .init(h:140))
        
        
        
        ///finishButton
        view.addSubview(finishButton)
        finishButton.anchorView(bottom:view.bottomAnchor,paddingBottom:.init(h:68),width: .init(w:226), height: .init(h:48))
        finishButton.centerX(inView:view)
        
        ///crossButton
        view.addSubview(crossButton)
        crossButton.anchorView(top: view.topAnchor, right:view.rightAnchor, paddingTop: .init(h: 50), width: .init(w:64), height: .init(h:64))
        
        
        
        // MARK: Loops for Permission Porperties
        
        for i in 0..<permissions.count {
            
            // permissionsStackView
            let permissionsStackView = UIStackView()
            permissionsStackView.axis = .horizontal
            permissionsStackView.distribution = .fillProportionally
            permissionsStackView.spacing = .init(w:20)
            permissionsStackView.anchorView(height: .init(h:40))
            
            // childStackView
            
            let childStackView = UIStackView()
            childStackView.axis = .vertical
            childStackView.distribution = .fillProportionally
            childStackView.spacing = .init(h:4)
            
            // permissionTitles
            let hexColor = UIColor(hex:"#000000")
            let permissionTitles = UILabel().label(title:permissions[i].title, textColor:hexColor,lines:1,fontStyle:UIFont(name: "Poppins-Regular", size:20),allignment:.left)
            
            // permissionSubTitles
            let permissionSubTitles = UILabel().label(title:permissions[i].subtitle, textColor:UIColor(hex:"#5A5F73"),lines: 1 ,fontStyle:UIFont(name: "Poppins-Medium", size:13),allignment:.left)
            
            // permissionImages
            let permissionImages = UIImageView().Image(contantMode:.scaleAspectFit)
            permissionImages.image = UIImage(named:permissions[i].image)
            permissionImages.anchorView(width:.init(w:28), height:.init(h:28))
            
            // AllowButtons
            let AllowButtons = UIButton().button(title:"Allow", titleColor:.orange,backgroundColor:.clear,font:UIFont(name:"Poppins-Light", size:13)!, cornerRadius:.init(h:7), borderColor:UIColor(hex:"#838BA7").cgColor, borderWidth: .init(w:1))
            AllowButtons.anchorView(width: .init(w:60), height: .init(h:32))
            AllowButtons.tag = i
            AllowButtons.addTarget(self, action: #selector(pressForPermission(_:)), for:.touchUpInside)
            
            // MARK: - Arrange all properties in a StackView
            
            permissionsStackView.addArrangedSubview(permissionImages)
            permissionsStackView.addArrangedSubview(childStackView)
            childStackView.addArrangedSubview(permissionTitles)
            childStackView.addArrangedSubview(permissionSubTitles)
            permissionsStackView.addArrangedSubview(AllowButtons)
            permissionButtons.append(AllowButtons)
            mainStackView.addArrangedSubview(permissionsStackView)
            
            
        }
        // end of the foor loop
    } // end of the loadui fuction
    
    // MARK: - pressFinish function
    
    @objc func pressFinish() {
        navigationController?.popViewController(animated:true)
    }
    
    // MARK: - pressForPermission function
    
    @objc func presscross() {
        navigationController?.popViewController(animated:true)
    }
    
    // MARK: - pressForPermission function
    
    @objc func pressForPermission(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            getPermissionOfPhoto(sender:sender)
            
        case 1:
            getLoacationAccess(sender:sender, manager: CLLocationManager())
            
            
        case 2:
            getaccesfromCalender(sender:sender)
            
            
        case 3:
            
            getNotification(sender:sender)
            
            
        default:
            getMotionAccess(sender:sender)
        } // end of switch case
        
        
        // MARK: - getPermissionOfPhoto fuction
        
        func getPermissionOfPhoto(sender:UIButton) {
            switch PHPhotoLibrary.authorizationStatus(for: .readWrite) {
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization { status in
                    DispatchQueue.main.async { [self] in
                        if status == .authorized {
                            toggleUI(id: 0)
                        }
                    }
                }
                
            case .restricted:
                showDoubleButton(messageTitle:AlertMessage.restricted.messageTitle)
                
            case .denied:
                showDoubleButton(messageTitle:AlertMessage.denied.messageTitle)
                
            case .authorized:
                showDoubleButton(messageTitle:AlertMessage.authorized.messageTitle)
                
                
            case .limited:
                showDoubleButton(messageTitle:AlertMessage.limited.messageTitle)
                
            @unknown default:
                print("default")
            }
        } // end of the function
    }
    
    // MARK: -  go to Settings app on iphone
    
    func gotoSettings() {
        if let url = URL(string:UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    // MARK: -  getLoacationAccess fuction
    
    func getLoacationAccess(sender:UIButton, manager: CLLocationManager) {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled(){
                DispatchQueue.main.async {
                    switch manager.authorizationStatus {
                    case .notDetermined:
                        manager.delegate = self
                        manager.requestAlwaysAuthorization()
                        manager.requestWhenInUseAuthorization()
                        
                    case .authorizedAlways,.authorizedWhenInUse:
                        DispatchQueue.main.async {
                            self.toggleUI(id: 1)
                        }
                        
                    case .restricted:
                        self.showDoubleButton(messageTitle:AlertMessage.restricted.messageTitle)
                    case .denied:
                        self.showDoubleButton(messageTitle:AlertMessage.denied.messageTitle)
                    @unknown default:
                        print("default")
                    }
                    
                }
            }
        }
    }
    
    
    // MARK: - showDoubleButton Function view aleart Message
    
    func showDoubleButton(messageTitle:String) {
        let limited = doubleButtonAleart(tittle:messageTitle,subTitle:AlertMessage.limited.messageSubTitle, firstButtonTitle:AlertMessage.limited.firstButtonTitle, firstButtonBackGrounColor:.clear, secondButtonTitle:AlertMessage.limited.secondButtonTitle, secondButtonBackGroundColor:.red) { [self] in
            if self.firstButton == false {
                gotoSettings()
            }
        }
        limited.delegate = self
        self.present(limited, animated:true)
    }
    
    // MARK: -  getaccesfromCalender fuction
    
    func getaccesfromCalender(sender:UIButton) {
        DispatchQueue.main.async {
            switch EKEventStore.authorizationStatus(for:.event) {
            case .notDetermined:
                self.eventStore.requestAccess(to:.event) { succes, error in
                    if succes,error == nil {
                        DispatchQueue.main.async { [self] in
                            toggleUI(id: 2)
                        }
                    }
                }
                
            case .restricted:
                self.showDoubleButton(messageTitle:AlertMessage.restricted.messageTitle)
            case .denied:
                self.showDoubleButton(messageTitle:AlertMessage.denied.messageTitle)
            case .authorized:
                self.showDoubleButton(messageTitle:AlertMessage.authorized.messageTitle)
            @unknown default:
                print("Default")
            }
        }
    }
    
    
    // MARK: -  getNotification fuction
    
    func getNotification(sender:UIButton) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async { [self] in
                switch settings.authorizationStatus {
                case .notDetermined:
                    UNUserNotificationCenter.current().requestAuthorization(options:[.alert, .sound]) { grand, error in
                        if grand == true && error == nil {
                            self.toggleUI(id: 3)
                        }
                        
                    }
                case .denied:
                    self.showDoubleButton(messageTitle:AlertMessage.denied.messageTitle)
                case .authorized:
                    self.showDoubleButton(messageTitle:AlertMessage.authorized.messageTitle)
                case .provisional:
                    self.showDoubleButton(messageTitle:AlertMessage.restricted.messageTitle)
                case .ephemeral:
                    self.showDoubleButton(messageTitle:AlertMessage.denied.messageTitle)
                @unknown default:
                    print("default")
                }
                
            }
        }
    }
    
    
    // MARK: -  getMotionAccess fuction
    
    func getMotionAccess(sender:UIButton) {
        initializePedometer { (steps, distance, floorClimb ,success) in
            DispatchQueue.main.async {
                switch CMPedometer.authorizationStatus() {
                case .notDetermined:
                    self.showDoubleButton(messageTitle:"Not Determined")
                    
                case .restricted:
                    self.showDoubleButton(messageTitle:AlertMessage.restricted.messageTitle)
                    
                case .denied:
                    self.showDoubleButton(messageTitle:AlertMessage.denied.messageTitle)
                    
                case .authorized:
                    DispatchQueue.main.async {
                        self.toggleUI(id: 4)
                    }
                @unknown default:
                    fatalError()
                }
            }
        }
    }
    
    //MARK: - initializePedometer
    
    public func initializePedometer(_ completionHandler: @escaping (Double, Double, Double, Bool) -> Void ){
        
        var stepCount: Double = 0
        var distance: Double = 0
        var floorClimb: Double = 0
        
        if isPedometerAvailable {
            let startDate = Calendar.current.startOfDay(for: Date())
            let endData = Date()
            
            pedometer.queryPedometerData(from: startDate, to: endData, withHandler: {data,error in
                guard let _ = data , error == nil else {return}
                stepCount = Double((data?.numberOfSteps.intValue)!)
                
                guard let pedometerDistance = data?.distance else { return }
                let distanceInMeters = Measurement(value: pedometerDistance.doubleValue, unit: UnitLength.meters)
                distance =  distanceInMeters.converted(to: .kilometers).value
                floorClimb = Double((data?.floorsAscended!.intValue)!)
                completionHandler(stepCount, distance, floorClimb, true)
            })
        }
    }
    
    // MARK: - locationManager delegate function
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        print(status.rawValue.description)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
        case .authorizedAlways, .authorizedWhenInUse:
            print("Authorized")
        default:
            print("Not Authorized")
        }
    }
}



