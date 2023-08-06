//
//  ContentView.swift
//  newproject
//
//  Created by New User on 7/13/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentPosition:Int = 0
    @Binding var onboardingShown: Bool
    let hexColor = UIColor(hex:"#2EA7FF")
    
    var body: some View {
        VStack(alignment:.center, spacing: 0) {
            ZStack(alignment: .topTrailing){
                TabView(selection:$currentPosition) {
                    ForEach(AppOnboardingModel.list) { viewdata in
                        OnboradingView(data:viewdata)
                            .tag(viewdata.id)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .padding(.bottom, .init(h: 54))
                
                skipButton
                    .padding(.trailing,.init(w:-5))
                    .padding(.top, .init(h: 28))
                
                
            }
            
            nextButton
                .padding(.bottom, .init(h: UIdeviceSize.width < 376 ? 30 : 70))
        }
        .background(Color.init(hex:"#FFFFFF"))
        
        .ignoresSafeArea()
    }
}

extension ContentView{
    
    
    
    var nextButton: some View {
        Button {
            currentPosition += 1
            if currentPosition > 4 {
                UserDefaults.standard.set(true, forKey: ONBOARDING_SHOWN_KEY)
                onboardingShown = true
                
            }
        } label: {
            
            Image(systemName:"arrow.right")
                .resizable()
                .scaledToFit()
                .frame(width:.init(w:24), height:.init(h:24))
                .customModifier(backgroundColor: .init(hex: "#2EA7FF"),foregroundColor:.white, cornerRadius:.init(h:68,for:68)/2 ,frame: (width:.init(w:68), height:.init(h:68,for:68), alignment:.center))
                .shadow(color: .init(hex: "#2EA7FF").opacity(0.5), radius: 10, x: 0, y: 10)
            
        }
    }
    
    var skipButton: some View {
        Button {
            UserDefaults.standard.set(true, forKey: ONBOARDING_SHOWN_KEY)
            onboardingShown = true
            
        } label: {
            
            Text("Skip")
                .font(.custom("Poppins-Regular", size:16))
                .foregroundColor(.black)
                .frame(width:.init(w:54))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(onboardingShown: .constant(false))
    }
    
}

