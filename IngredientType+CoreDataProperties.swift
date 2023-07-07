//
//  IngredientType+CoreDataProperties.swift
//  GroceryV2
//
//  Created by JM Velarde on 7/7/23.
//
//

import Foundation
import CoreData


extension IngredientType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IngredientType> {
        return NSFetchRequest<IngredientType>(entityName: "IngredientType")
    }

    @NSManaged public var category: String?
    @NSManaged public var name: String?

}

extension IngredientType : Identifiable {

}
