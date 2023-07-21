//
//  Interactor.swift
//  RandomCatGeneratorSwift
//
//  Created by MacBook Pro on 21.07.2023.
//

import Foundation
import UIKit
import CoreData

class Interactor{
    static let shared: Interactor = {
        let instance = Interactor()
        return instance
    }()
    
    private init(){
        
    }

    
    func downloadImage(from str: String, completion: @escaping (UIImage?) -> Void) {
        if let imageUrl = URL(string: str) {
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error downloading image: \(String(describing: error?.localizedDescription))")
                    DispatchQueue.main.async {
                        completion(self.downloadAnonymousImage())
                    }
                    return
                }

                DispatchQueue.main.async {
                    let downloadedImage = UIImage(data: data)
                    completion(downloadedImage)
                }
            }.resume()
        } else {
            print("Invalid URL for the image")
            completion(downloadAnonymousImage())
        }
    }
    
    
    func addInModel(from cat_id: String){
        let newCat = CatGallery(context: PersistentContainer.shared.viewContext)
        newCat.id = cat_id
        newCat.image = BASE_URL + "/cat/" + cat_id
        PersistentContainer.shared.saveContext()
        self.writeAllCats()
    }
    func writeAllCats(){
        let fetchRequest: NSFetchRequest<CatGallery> = CatGallery.fetchRequest()
        do {
            let objects = try PersistentContainer.shared.viewContext.fetch(fetchRequest)
            for object in objects {
                print("\(String(describing: object.id)), \(String(describing: object.image))")
            }
        } catch {
            print("Error write all cats")
        }
    }
    func deleteAllCats(){
        let fetchRequest: NSFetchRequest<CatGallery> = CatGallery.fetchRequest()
        do {
            let objects = try PersistentContainer.shared.viewContext.fetch(fetchRequest)
            for object in objects {
                PersistentContainer.shared.viewContext.delete(object)
            }
            try PersistentContainer.shared.viewContext.save()
        } catch {
            print("Error deleting")
        }
    }
    func deleteCat(_ cat_id: String?){
        let fetchRequest: NSFetchRequest<CatGallery> = CatGallery.fetchRequest()
        do {
            let objects = try PersistentContainer.shared.viewContext.fetch(fetchRequest)
            for object in objects {
                if object.id == cat_id{
                    PersistentContainer.shared.viewContext.delete(object)
                    break
                }
            }
            try PersistentContainer.shared.viewContext.save()
        } catch {
            print("Error deleting")
        }
    }
    
    func downloadAnonymousImage() -> UIImage {
        if let filePath = Bundle.main.path(forResource: "AnonymousCat", ofType: "png"){
            let fileURL = URL(fileURLWithPath: filePath)
            let img = UIImage(contentsOfFile: fileURL.path)
            return img!
        }
        return UIImage()
    }
}
