//
//  PersistentContainer.swift
//  RandomCatGeneratorSwift
//
//  Created by MacBook Pro on 20.07.2023.
//

import CoreData

class PersistentContainer: NSPersistentContainer{
    
    static let shared: PersistentContainer = {
        let conteiner = PersistentContainer(name: "Model")
        conteiner.loadPersistentStores { _, error in
            if let error{
                print(error)
            }
        }
        return conteiner
    }()
    
    func saveContext(backgroundContext: NSManagedObjectContext? = nil){
        let context = backgroundContext ?? viewContext
        guard context.hasChanges else {return}
        do{
            try context.save()
        }catch {
            print(error)
        }
    }
}
