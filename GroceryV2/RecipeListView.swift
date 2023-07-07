//
//  RecipeListView.swift
//  GroceryV2
//
//  Created by JM Velarde on 7/7/23.
//

import SwiftUI

struct RecipeListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var recipes: FetchedResults<Recipe>
    
    @State private var name = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Name", text: $name)
                    
                    Button("Add Recipe") {
                        let newRecipe = Recipe(context: moc)
                        newRecipe.name = name
                        name = ""
                    }
                }
                
                Section {
                    ForEach(recipes, id:\.self) {recipe in
                        NavigationLink {
                            
                        } label: {
                            Text(recipe.name ?? "")
                        }
                    }
                }
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
