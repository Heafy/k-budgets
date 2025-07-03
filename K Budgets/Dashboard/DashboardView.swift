//
//  DashboardView.swift
//  K Budgets
//
//  Created by Jorge Martinez on 27/06/25.
//

import SwiftUI
import SwiftData

struct SectionView<T: CustomStringConvertible>: View {
    var title: String
    var items: [T]

    var body: some View {
        Section(title) {
            ForEach(Array(items.enumerated()), id: \.offset) { _, item in
                Text("• \(item.description)")
            }
        }
    }
}

struct DashboardView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var accounts: [Account]
    @Query private var categories: [Category]
    @Query private var transactions: [Transaction]
    @Query private var budgets: [Budget]
    @Query private var colors: [KColor]
    
    var body: some View {
        Form {
            Text("Dashboard View")
            
            Button("Seed Data") {
                DataSeeder.seedData(modelContext: modelContext)
            }
            
            Button("Delete Data") {
                DataSeeder.deleteAllData(modelContext: modelContext)
            }
            
            Button("Check data") {
                print(colors)
                print()
                print(accounts)
                print()
                print(transactions)
                print()
                print(categories)
            }
            
            SectionView(title: "Accounts", items: accounts)
            SectionView(title: "Colors", items: colors)
            SectionView(title: "Transactions", items: transactions)
            SectionView(title: "Categories", items: categories)
            SectionView(title: "Budgets", items: budgets)
        }
    }
}

#Preview {
    DashboardView()
}
