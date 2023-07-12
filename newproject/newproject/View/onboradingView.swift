//
//  onboradingView.swift
//  newproject
//
//  Created by New User on 7/12/23.
//

import SwiftUI

struct OnboradingView: View {
    var data: AppOnboardingModel
    var body: some View {
        VStack(alignment:.center, spacing:12) {
            
                Image(data.imageName)
                    .resizable()
                    .scaledToFit()
            
            
            Text(data.title)
            Text(data.subTitle)
                .multilineTextAlignment(.center)
            
            Spacer()
            
        }
       
        
    }
}

struct onboradingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboradingView(data: AppOnboardingModel.list.first!)
    }
}
