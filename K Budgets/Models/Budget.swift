//
//  Budget.swift
//  K Budgets
//
//  Created by Jorge Martinez on 01/07/25.
//

import Foundation
import SwiftData

@Model
class Budget: Identifiable {
    var id: UUID
    var name: String
    var amount: Double

    @Relationship
    var categories: [Category]

    init(
        id: UUID = UUID(),
        name: String,
        amount: Double,
        categories: [Category] = []
    ) {
        self.id = id
        self.name = name
        self.amount = amount
        self.categories = categories
    }

    func totalSpent(from transactions: [Transaction]) -> Double {
        transactions
            .filter { categories.contains($0.category) && $0.type == .expense }
            .map(\.amount)
            .reduce(0, +)
    }

    func remaining(from transactions: [Transaction]) -> Double {
        amount - totalSpent(from: transactions)
    }
}
