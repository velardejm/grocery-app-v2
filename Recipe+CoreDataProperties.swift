//
//  Recipe+CoreDataProperties.swift
//  GroceryV2
//
//  Created by JM Velarde on 7/7/23.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var name: String?
    @NSManaged public var ingredient: NSSet?
    
    public var ingredientsArray: [Ingredient] {
        let set = ingredient as? Set<Ingredient> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for ingredient
extension Recipe {

    @objc(addIngredientObject:)
    @NSManaged public func addToIngredient(_ value: Ingredient)

    @objc(removeIngredientObject:)
    @NSManaged public func removeFromIngredient(_ value: Ingredient)

    @objc(addIngredient:)
    @NSManaged public func addToIngredient(_ values: NSSet)

    @objc(removeIngredient:)
    @NSManaged public func removeFromIngredient(_ values: NSSet)

}

extension Recipe : Identifiable {

}
