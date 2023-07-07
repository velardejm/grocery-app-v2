//
//  IngredientCategory+CoreDataProperties.swift
//  GroceryV2
//
//  Created by JM Velarde on 7/7/23.
//
//

import Foundation
import CoreData


extension IngredientCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IngredientCategory> {
        return NSFetchRequest<IngredientCategory>(entityName: "IngredientCategory")
    }

    @NSManaged public var name: String?

}

extension IngredientCategory : Identifiable {

}
