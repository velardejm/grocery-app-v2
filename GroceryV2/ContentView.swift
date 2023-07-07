//
//  ContentView.swift
//  GroceryV2
//
//  Created by JM Velarde on 7/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            AddRecipeView().tabItem {
                Text("Add Recipe")
            }
            
            IngredientTypeView().tabItem {
                Text("Ingredient Types")
            }

            IngredientCategoryView().tabItem {
                Text("Ingredient Categories")
            }

            IngredientListView().tabItem {
                Text("Ingredients List")
            }
            
            RecipeListView().tabItem {
                Text("Recipe List")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
