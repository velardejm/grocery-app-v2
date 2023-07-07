//
//  AddRecipeView.swift
//  GroceryV2
//
//  Created by JM Velarde on 7/7/23.
//

import SwiftUI

struct AddRecipeView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var ingredients: FetchedResults<Ingredient>
    @FetchRequest(sortDescriptors: []) var recipes: FetchedResults<Recipe>
    
    @State private var recipeName = ""
    @State private var ingredientName = ""
    @State private var quantity = 0
    @State private var unit = ""
    @State private var category = ""
    
    @State private var newRecipe: Recipe?
    
    var body: some View {
        List {
            Section {
                TextField("Recipe Name", text: $recipeName)
            }
            
            Section {
                TextField("Ingredient Name", text: $ingredientName)
                TextField("Quantity", value: $quantity, format: .number)
                TextField("Unit", text: $unit)
                TextField("Category", text: $category)
                
                Button("Add Ingredient") {
                    if newRecipe == nil {
                        let recipe = Recipe(context: moc)
                        newRecipe = recipe
                        print("New recipe created")
                    }
                    
                    let newIngredient = Ingredient(context: moc)
                    newIngredient.name = ingredientName
                    newIngredient.quantity = Float(quantity)
                    newIngredient.unit = unit
                    newIngredient.category = "Uncategorized"
                    newIngredient.recipe = newRecipe
                    
                    resetForm()
                }
            }
            
            Section {
                if let ingredients = newRecipe?.ingredientsArray {
                    ForEach(ingredients, id:\.self) {ingredient in
                        Text(ingredient.name ?? "")
                    }
                }
            }
            
        }
    }
    
    func resetForm() {
        ingredientName = "."
        ingredientName = ""
        quantity = 0
        unit = ""
        category = ""
    }
}

//struct AddRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddRecipeView()
//    }
//}
