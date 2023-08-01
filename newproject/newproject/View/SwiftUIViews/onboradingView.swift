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
        ZStack (alignment: .top) {
            Image(data.imageName)
                .resizable()
                .scaledToFit()
            VStack(spacing: 0){
                Spacer()
                
                Text(data.title)
                    .font(.custom("Poppins-SemiBold", size:.init(h:24)))
                Text(data.subTitle)
                    .font(.custom("Poppins-Regular", size:.init(h:16)))
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding(.bottom, .init(h:100))
        }
    }
}

struct onboradingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboradingView(data: AppOnboardingModel.list.first!)
    }
}
