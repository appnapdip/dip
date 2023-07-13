//
//  MainView.swift
//  newproject
//
//  Created by New User on 7/13/23.
//

import SwiftUI

struct MainView: View {
    @State var onboardingShown: Bool = false
    
    var body: some View {
        ZStack{
            Color.red
            if !onboardingShown{
                ContentView(onboardingShown: $onboardingShown)
            }
        }
        .ignoresSafeArea()
        .onAppear{
            //UserDefaults.standard.set(false, forKey: "onboardingShown")
            onboardingShown = UserDefaults.standard.bool(forKey: "onboardingShown")
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
