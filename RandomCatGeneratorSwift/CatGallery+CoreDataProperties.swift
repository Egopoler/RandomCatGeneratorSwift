//
//  CatGallery+CoreDataProperties.swift
//  RandomCatGeneratorSwift
//
//  Created by MacBook Pro on 20.07.2023.
//
//

import Foundation
import CoreData


extension CatGallery {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CatGallery> {
        return NSFetchRequest<CatGallery>(entityName: "CatGallery")
    }

    @NSManaged public var image: String?
    @NSManaged public var id: String?

}

extension CatGallery : Identifiable {

}
