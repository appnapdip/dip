//
//  SettingsView.swift
//  newproject
//
//  Created by New User on 7/31/23.
//

import SwiftUI

struct SettingsView: View {
    var user:GitHubUsers?
    @StateObject var vm:ImageLoaderService = ImageLoaderService.shared
    
    var body: some View {
        VStack(spacing: .init(h:20)) {
            if let image = vm.image{
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:100, height:100)
                    .background(Color.gray)
                    .clipShape(Circle())
            }
            Text(user?.login ?? "Nologin")
                .bold()
                .font(.title)
            
            Text(user?.bio ?? "No BIO")
                .padding()
            Spacer()
            
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

// MARK: - Error Catagories
enum Erros: Error {
    case invalidURL
    case inValidResponse
    case inValidData
}
