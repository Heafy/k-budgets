//
//  DataSeeder.swift
//  K Budgets
//
//  Created by Jorge Martinez on 02/07/25.
//

import Foundation
import SwiftData

class DataSeeder {
    
    public static func seedData(modelContext: ModelContext) {
        // Colors
        let blueColor = KColor(red: 0.2, green: 0.5, blue: 0.9)
        let greenColor = KColor(red: 0.1, green: 0.7, blue: 0.3)
        let orangeColor = KColor(red: 1.0, green: 0.6, blue: 0.2)
        modelContext.insert(blueColor)
        modelContext.insert(greenColor)
        modelContext.insert(orangeColor)
        
        // Accounts
        let wallet = Account(name: "Wallet", iconName: "wallet.pass", color: blueColor, initialBalance: 1000)
        let bank = Account(name: "Bank", iconName: "banknote", color: greenColor, initialBalance: 5000)
        modelContext.insert(wallet)
        modelContext.insert(bank)
        
        // Categories
        let food = Category(name: "Food", iconName: "fork.knife", color: orangeColor)
        let salary = Category(name: "Salary", iconName: "dollarsign.circle", color: greenColor)
        let entertainment = Category(name: "Movies", iconName: "popcorn", color: blueColor)
        modelContext.insert(food)
        modelContext.insert(salary)
        modelContext.insert(entertainment)
        
        // Transactions
        let transaction1 = Transaction(amount: 250, type: .expense, concept: "Groceries", date: Date(), category: food, account: wallet)
        let transaction2 = Transaction(amount: 12000, type: .income, concept: "Monthly salary", date: Date().addingTimeInterval(-86400 * 3), category: salary, account: bank)
        let transaction3 = Transaction(amount: 180, type: .expense, concept: "Cinema night", date: Date().addingTimeInterval(-86400 * 5), category: entertainment, account: wallet)
        modelContext.insert(transaction1)
        modelContext.insert(transaction2)
        modelContext.insert(transaction3)
        
        // Crear presupuesto
        let budget = Budget(name: "Budget", amount: 2000, categories: [entertainment, food])
        modelContext.insert(budget)
        do {
            try modelContext.save()
        } catch {
            print("Error model context saving - \(error)")
        }
    }
    
    private static func deleteAllInstances(of type: any PersistentModel.Type, modelContext: ModelContext) {
        do {
            try modelContext.delete(model: type.self)
        } catch {
            print("Failed to delete \(type) - \(error)")
        }
    }
    
    public static func deleteAllData(modelContext: ModelContext) {
        deleteAllInstances(of: Transaction.self, modelContext: modelContext)
        deleteAllInstances(of: Account.self, modelContext: modelContext)
        deleteAllInstances(of: Budget.self, modelContext: modelContext)
        deleteAllInstances(of: Category.self, modelContext: modelContext)
        deleteAllInstances(of: KColor.self, modelContext: modelContext)
    }
}
