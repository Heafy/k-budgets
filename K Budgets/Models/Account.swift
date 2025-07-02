//
//  Account.swift
//  K Budgets
//
//  Created by Jorge Martinez on 01/07/25.
//

import Foundation
import SwiftData

@Model
class Account: Identifiable {
    var id: UUID
    var name: String
    var iconName: String
    
    @Relationship
    var color: KColor
    
    var initialBalance: Double
    
    @Relationship(deleteRule: .cascade, inverse: \Transaction.account)
    var transactions: [Transaction]

    init(
        id: UUID = UUID(),
        name: String,
        iconName: String,
        color: KColor,
        initialBalance: Double = 0.0
    ) {
        self.id = id
        self.name = name
        self.iconName = iconName
        self.color = color
        self.initialBalance = initialBalance
        self.transactions = []
    }

    var currentBalance: Double {
        let incomes = transactions.filter { $0.type == .income }.map(\.amount).reduce(0, +)
        let expenses = transactions.filter { $0.type == .expense }.map(\.amount).reduce(0, +)
        return initialBalance + incomes - expenses
    }
}
