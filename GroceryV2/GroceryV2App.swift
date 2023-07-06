//
//  GroceryV2App.swift
//  GroceryV2
//
//  Created by JM Velarde on 7/6/23.
//

import SwiftUI

@main
struct GroceryV2App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
