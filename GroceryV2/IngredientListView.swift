//
//  IngredientListView.swift
//  GroceryV2
//
//  Created by JM Velarde on 7/6/23.
//

import CoreData
import SwiftUI

struct IngredientListView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var ingredientTypes: FetchedResults<IngredientType>
    @FetchRequest(sortDescriptors: []) var ingredients: FetchedResults<Ingredient>
    @FetchRequest(sortDescriptors: []) var ingredientCategories: FetchedResults<IngredientCategory>
    
    @State private var name = ""
    @State private var unit = ""
    @State private var quantity: Float?
    @State private var category = "Poultry"
    
    var categoryArray: [String] {
        var categoryArray:[String] = []
        for index in ingredientCategories.indices {
            categoryArray.append(ingredientCategories[index].name ?? "")
        }
        return categoryArray
    }
    
    var body: some View {
        List {
            Section {
                VStack {
                    HStack {
                        TextField("Name", text: $name)
                        TextField("Quantity", value: $quantity, format: .number)
                        TextField("Unit", text: $unit)
                    }
                    
                    Divider()
                    
                    Picker("Category", selection: $category) {
                        ForEach(categoryArray, id: \.self) {category in
                            Text(category)
                        }
                    }
                }
                
                //                Button("Add Ingredient") {
                //                    let newIngredient = Ingredient(context: moc)
                //                    newIngredient.name = name
                //                    newIngredient.quantity = Float(quantity ?? 0)
                //                    newIngredient.unit = unit
                //                    newIngredient.category = category
                //
                //                }
                
            } header: {
                Text("Add Ingredient")
            }
            
            Section {
                ForEach(ingredients, id: \.self) {ingredient in
                    Text(ingredient.name ?? "Unknown Ingredient")
                }
            } header: {
                Text("Ingredient List")
            }
            
            Button("Test") {
                if let result = getType() {
                    print(result.name ?? "")
                    print(result.category ?? "")
                }
                
            }
        }
    }
    
    func getType() -> IngredientType? {
        var typeArray: [IngredientType] = []
        
        for i in ingredientTypes.indices {
            typeArray.append(ingredientTypes[i])
        }
        
        let filtered = typeArray.filter({name.contains($0.name ?? "")})
        
//        print(filtered.count)
        
        if filtered.count > 0 {
            return filtered[0]
        }
        
        return nil
    }
    
}

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientListView()
    }
}


