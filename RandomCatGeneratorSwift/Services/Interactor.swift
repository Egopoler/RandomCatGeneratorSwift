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
    
    lazy var frc: NSFetchedResultsController<CatGallery> = {
        let request = CatGallery.fetchRequest()
        request.sortDescriptors = []
        let frc = NSFetchedResultsController(fetchRequest: request,
            managedObjectContext: PersistentContainer.shared.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        //frc.delegate = self
        return frc
    }()
    
    func downloadImage(from str: String, completion: @escaping (UIImage?) -> Void) {
            if let imageUrl = URL(string: str) {
                URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                    guard let data = data, error == nil else {
                        print("Error downloading image: \(String(describing: error))")
                        DispatchQueue.main.async {
                            completion(nil)
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
                completion(nil)
        }
    }
    
    
    func addInModel(from cat_id: String){
        let newCat = CatGallery(context: PersistentContainer.shared.viewContext)
        newCat.id = cat_id
        newCat.image = ""
        PersistentContainer.shared.saveContext()
    }
    
}
