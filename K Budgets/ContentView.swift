//
//  ContentView.swift
//  K Budgets
//
//  Created by Jorge Martinez on 27/06/25.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            Tab("Dashboard", systemImage: "chart.pie.fill") {
                DashboardView()
            }
            Tab("Transactions", systemImage: "list.bullet.circle.fill") {
                TransactionsView()
            }
            Tab("Budget", systemImage: "chart.line.uptrend.xyaxis.circle.fill") {
                BudgetView()
            }
            Tab("Settings", systemImage: "gearshape.circle.fill") {
                SettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
