//
//  IngredientTypeView.swift
//  GroceryV2
//
//  Created by JM Velarde on 7/6/23.
//

import SwiftUI

struct IngredientTypeView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var ingredientTypes: FetchedResults<IngredientType>
    @FetchRequest(sortDescriptors: []) var ingredientCategories: FetchedResults<IngredientCategory>
    
    @State private var name = ""
    @State private var category = "Poultry"
    
    var categoryArray: [String] {
        var categoryArray:[String] = []
        for index in ingredientCategories.indices {
            categoryArray.append(ingredientCategories[index].name ?? "")
        }
        return categoryArray
    }
    
    
    var body: some View {
        VStack {
            List {
                Section {
                    HStack {
                        TextField("Name", text: $name)
                        
                        Picker("", selection: $category) {
                            ForEach(categoryArray, id: \.self) {category in
                                Text(category)
                            }
                        }
                    }
                    
                    Button("Add Ingredient Type") {
                        let newIngedientType = IngredientType(context: moc)
                        newIngedientType.name = name
                        newIngedientType.category = category
//                        try? moc.save()
                        name = ""
                        category = "Others"
                    }
                    
                } header: {
                    Text("Add new Ingredient Type").textCase(nil)
                }
                
                
                Section {
                    ForEach(ingredientTypes, id: \.self) {ingredientType in
                        HStack {
                            Text(ingredientType.name ?? "Unknown Ingredient")
                            Spacer()
                            Text(ingredientType.category ?? "Unknown Category")
                        }
                    }.onDelete(perform: delete)
                } header: {
                    Text("Ingredient Types").textCase(nil)
                }
                
                Section {
                    Button("Delete All") {
                        deleteAll()
                    }
                }
                
                Section {
                    Button("Test") {
                        print(category)
                    }
                }
            }
        }
    }
    
    func delete(at offsets:IndexSet) {
        for offset in offsets {
            moc.delete(ingredientTypes[offset])
            // try? moc.save()
        }
    }
    
    func deleteAll() {
        for index in ingredientTypes.indices {
            moc.delete(ingredientTypes[index])
        }
        // try? moc.save()
    }
}

//struct IngredientTypeView_Previews: PreviewProvider {
//    static var previews: some View {
//        IngredientTypeView()
//    }
//}

