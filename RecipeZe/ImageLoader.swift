//
//  ImageLoader.swift
//  RecipeZe
//
//  Created by Yusmen Kadir on 23.09.21.
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var downloadedData: Data?
    
    func donwloadImage(url:String) {
        
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data,_,error in
            guard let data = data , error == nil else{
                return
            }
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
    
    
}



