//
//  SettingsView.swift
//  newproject
//
//  Created by New User on 7/31/23.
//

import SwiftUI

struct SettingsView: View {
    @State var user:GitHubUsers?
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image:UIImage = UIImage()
    
    let userApi = "https://api.github.com/users/skb96"
    
    var body: some View {
        VStack(spacing:.init(h:20)) {
            Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:100, height:100)
                        .background(Color.gray)
                        .clipShape(Circle())
                        .onReceive(imageLoader.$image) { image in
                            self.image = image
                        }
          Text(user?.login ?? "Nologin")
                .bold()
                .font(.title)
            
            Text(user?.bio ?? "No BIO")
                .padding()
            Spacer()
            
        }
        .padding()
        .onAppear {
            Task{
                do {
                   user = try await getUsers()
                    
                    DispatchQueue.main.async {
                        imageLoader.loadImage(for:user?.avatarUrl ?? "")
                    }
                }
                catch Erros.inValidData{
                    print("inValidData")
                }
                catch Erros.inValidResponse{
                    print("inValidResponse")
                }
                catch Erros.invalidURL{
                    print("invalidURL")
                }
                catch {
                    print("unexpected data")
                }
            }
        }
    }
    
    
    
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
    
    private func fetchData() async{
        do{
            user = try await getUsers()
        }
        catch Erros.inValidData{
            print("inValidData")
        }
        catch Erros.inValidResponse{
            print("inValidResponse")
        }
        catch Erros.invalidURL{
            print("invalidURL")
        }
        catch {
            print("Unknown")
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


enum Erros: Error {
    case invalidURL
    case inValidResponse
    case inValidData
}
