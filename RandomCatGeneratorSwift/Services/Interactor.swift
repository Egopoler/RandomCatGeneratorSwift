//
//  Interactor.swift
//  RandomCatGeneratorSwift
//
//  Created by MacBook Pro on 21.07.2023.
//

import Foundation
import UIKit

class Interactor{
    static let shared: Interactor = {
        let instance = Interactor()
        return instance
    }()
    
    private init(){
        
    }
    func downloadImage(from str: String) -> UIImage?{
        var img: UIImage?
        if let imageUrl = URL(string: str) {
            
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error downloading image: \(error)")
                    return
                }
                
                DispatchQueue.main.async {
                    let downloadedImage = UIImage(data: data)
                    img = downloadedImage
                }
            }.resume()
        } else {
            print("Invalid URL for the image")
        }
        return img
    }

    
}
