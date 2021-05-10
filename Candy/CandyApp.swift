//
//  CandyApp.swift
//  Candy
//
//  Created by Olivier Van hamme on 10/05/2021.
//

import SwiftUI

@main
struct CandyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
