//
//  DataController.swift
//  GroceryV2
//
//  Created by JM Velarde on 7/6/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    var container = NSPersistentContainer(name: "NewGroceryData")
    
    init() {
        container.loadPersistentStores {description, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

