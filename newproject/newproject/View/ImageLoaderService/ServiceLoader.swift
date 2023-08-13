//
//  ServiceLoader.swift
//  newproject
//
//  Created by New User on 7/31/23.
//

import Foundation
import SwiftUI
// MARK: -  ImageLoaderService class

class ImageLoaderService: ObservableObject {
    static let shared = ImageLoaderService()
    
    @Published var image: UIImage!
    
    func loadImage(for urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
}
