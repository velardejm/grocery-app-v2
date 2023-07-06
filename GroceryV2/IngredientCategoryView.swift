//
//  CategoryView.swift
//  GroceryV2
//
//  Created by JM Velarde on 7/6/23.
//

import CoreData
import SwiftUI



struct IngredientCategoryView: View {
    @Environment(\.managedObjectContext) var moc

    @FetchRequest(sortDescriptors: []) var ingredientCategories: FetchedResults<IngredientCategory>

    @State private var name = ""

    var body: some View {
        List {
            Section {
                TextField("Name", text: $name)

                Button("Add Category") {
                    let newCategory = IngredientCategory(context: moc)
                    newCategory.name = name
                    name = ""
//                     try? moc.save()
                }
            }

            Section {
                ForEach(ingredientCategories, id: \.self) {ingredientCategory in
                    Text(ingredientCategory.name ?? "Unknown Category")
                }.onDelete(perform: delete)


                Button("Delete All") {
                    deleteAll()
                }
            }
        }
    }

    func delete(at offsets:IndexSet) {
        for offset in offsets {
            moc.delete(ingredientCategories[offset])
            // try? moc.save()
        }
    }

    func deleteAll() {
        for index in ingredientCategories.indices {
            moc.delete(ingredientCategories[index])
        }

        // try? moc.save()
    }

}

//struct CategoryView_Previews: PreviewProvider {
//    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//
//    static var previews: some View {
//        let newCategory = IngredientCategory(context: moc)
//        newCategory.name = "Test"
//
//        return IngredientCategoryView(ingredientCategories: newCategory)
//    }
//}

