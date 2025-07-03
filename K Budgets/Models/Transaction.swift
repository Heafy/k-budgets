//
//  Transaction.swift
//  K Budgets
//
//  Created by Jorge Martinez on 01/07/25.
//

import Foundation
import SwiftData

@Model
class Transaction: Identifiable {
    var id: UUID
    var amount: Double
    var type: TransactionType
    var concept: String
    var date: Date
    
    @Relationship var category: Category
    @Relationship var account: Account

    init(
        id: UUID = UUID(),
        amount: Double,
        type: TransactionType,
        concept: String,
        date: Date = .now,
        category: Category,
        account: Account
    ) {
        self.id = id
        self.amount = amount
        self.type = type
        self.concept = concept
        self.date = date
        self.category = category
        self.account = account
    }
}

enum TransactionType: String, Codable, CaseIterable {
    case expense = "Expense"
    case income = "Income"
    case transfer = "Transfer"
}

extension Transaction: CustomStringConvertible {
    var description: String {
        "Transaction(amount: \(amount), type: \(type.rawValue), concept: \(concept), date: \(date), category: \(category.name), account: \(account.name))"
    }
}
