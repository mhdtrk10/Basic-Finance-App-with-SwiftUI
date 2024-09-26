//
//  FinanceAppApp.swift
//  FinanceApp
//
//  Created by Mehdi Oturak on 24.09.2024.
//

import SwiftUI

@main
struct FinanceAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
