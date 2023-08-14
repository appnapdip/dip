//
//  SettingsViewController.swift
//  newproject
//
//  Created by New User on 8/1/23.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - Settings Page

class SettingsViewController:UIViewController , RemoveAleartView {
    
    var user:GitHubUsers?
    var loadervC = customLoaderController()
    
    // MARK: - Protocol Function
    func pressAction(firstButton: Bool) {
        self.firstButton = firstButton
    }
    
    // MARK: - Propertieds
    
    var firstButton: Bool = true
    
    //  logOutButton
    lazy var logOutButton:UIButton = {
        let thisButton = UIButton().button(title:"Log Out" , titleColor:UIColor(hex:"#FFFFFF"),backgroundColor:UIColor(hex:"#FF4D4D"),font: UIFont(name:"Poppins-SemiBold", size:.init(h:16))!,cornerRadius:
                .init(h:16))
        thisButton.addTarget(self, action: #selector(pressLogOutAction), for: .touchUpInside)
        return thisButton
        
    }()
    
    //  backButton
    lazy var backButton: UIButton = {
        let thisButton = UIButton().button(backgroundImage: UIImage(systemName:"chevron.backward"))
        thisButton.tintColor = .black
        thisButton.addTarget(self, action: #selector(pressBackAction), for: .touchUpInside)
        return thisButton
    }()
    
    //  permissionButton
    lazy var permissionButton: UIButton = {
        let thisButton = UIButton().button(backgroundImage:UIImage(named:"images"))
        thisButton.tintColor = UIColor(hex:"#838BA7")
        //thisButton.backgroundColor = .red
        thisButton.addTarget(self, action: #selector(pressOnPermission), for: .touchUpInside)
        return thisButton
    }()
    
    
    let userApi = "https://api.github.com/users/dip"
    
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsLoadUI()
    }
    
    // MARK: - settingsLoadUI()
    
    private func settingsLoadUI() {
        view.backgroundColor = .white
        /// logOutButton
        view.addSubview(logOutButton)
        logOutButton.anchorView(bottom:view.bottomAnchor,paddingBottom:.init(h:46),width: .init(w:158), height: .init(h:56))
        logOutButton.centerX(inView:view)
        ///backButton
        view.addSubview(backButton)
        backButton.anchorView(top:view.topAnchor,left:view.leftAnchor, paddingTop: .init(h:50),width:.init(h:78),height: .init(h:78,for:.init(w:78)))
        /// permissionButton
        view.addSubview(permissionButton)
        permissionButton.anchorView(top:view.topAnchor,right:view.rightAnchor, paddingTop: .init(h:50),width:.init(h:78),height: .init(h:78,for:.init(w:78)))
        fetchApi()
    }
    
    // MARK: showLoader To Present Customloader
    
    private func showLoader(){
        DispatchQueue.main.async { [self] in
            loadervC.modalPresentationStyle = .overFullScreen
            loadervC.modalTransitionStyle = .crossDissolve
            present(loadervC, animated: false)
        }
    }
    
    // MARK: - Added SwiftUIView In SettingsViewController
    
    private func addUserView(){
        let SettingsView = UIHostingController(rootView: SettingsView(user: user))
        addChild(SettingsView)
        view.addSubview(SettingsView.view)
        SettingsView.view.anchorView(top: backButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height:.init(h:UIdeviceSize.height * 0.5))
        SettingsView.didMove(toParent: self)
    }
    
    // MARK: - pressBackAction()
    
    @objc func pressBackAction() {
        navigationController?.popToRootViewController(animated:true)
        
    }
    
    // MARK: - pressLogOutAction()
    
    @objc func pressLogOutAction() {
        let sAVC = singleButtonAlert(tittle:AlertMessage.inProgress.messageTitle, subTitle: AlertMessage.inProgress.messageSubTitle, firstButtonTitle:AlertMessage.inProgress.firstButtonTitle, firstButtonBackGrounColor:.clear) {
        }
        sAVC.delegate = self
        self.present(sAVC, animated: true)
        
    }
    
    // MARK: - pressOnPermission()
    
    @objc func pressOnPermission() {
        let svc = PerMissionViewController()
        navigationController?.pushViewController(svc, animated:true)
        
    }
    
    // MARK: - fetchApi()
    
    func fetchApi() {
        Task{
            showLoader()
            
            do {
                user = try await getUsers()
                
                DispatchQueue.main.async {
                    ImageLoaderService.shared.loadImage(for:self.user?.avatarUrl ?? "")
                    self.addUserView()
                    self.loadervC.dismissLoader()
                }
            }
            catch Erros.inValidData{
                print("inValidData")
                self.loadervC.dismissLoader()
                self.showToast(message: ToastMessage.networkError.description)
            }
            catch Erros.inValidResponse{
                print("inValidResponse")
                self.loadervC.dismissLoader()
                self.showToast(message: ToastMessage.networkError.description)
            }
            catch Erros.invalidURL{
                print("invalidURL")
                self.loadervC.dismissLoader()
                self.showToast(message: ToastMessage.networkError.description)
            }
            catch {
                print("unexpected data")
                self.loadervC.dismissLoader()
                self.showToast(message: ToastMessage.networkError.description)
            }
        }
        
        
        // MARK: - getUsers function json decoding
        
        func getUsers() async throws -> GitHubUsers {
            guard let url = URL(string:userApi) else {throw Erros.invalidURL}
            let(data,response) = try await URLSession.shared.data(from:url)
            guard let response = response as? HTTPURLResponse,response.statusCode == 200 else {throw Erros.inValidResponse}
            
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(GitHubUsers.self, from:data)
                
            } catch  {
                throw Erros.inValidData
            }
        }
    }
}


