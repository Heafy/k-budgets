//
//  K_BudgetsApp.swift
//  K Budgets
//
//  Created by Jorge Martinez on 27/06/25.
//

import SwiftUI
import SwiftData

@main
struct K_BudgetsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Account.self,
            Budget.self,
            Category.self,
            KColor.self,
            Transaction.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
