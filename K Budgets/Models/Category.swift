//
//  Category.swift
//  K Budgets
//
//  Created by Jorge Martinez on 01/07/25.
//

import Foundation
import SwiftData

@Model
class Category: Identifiable {
    var id: UUID
    var name: String
    var iconName: String

    @Relationship
    var color: KColor

    @Relationship(deleteRule: .cascade, inverse: \Transaction.category)
    var transactions: [Transaction]

    init(
        id: UUID = UUID(),
        name: String,
        iconName: String,
        color: KColor
    ) {
        self.id = id
        self.name = name
        self.iconName = iconName
        self.color = color
        self.transactions = []
    }
}

extension Category: CustomStringConvertible {
    var description: String {
        "Category(name: \(name), icon: \(iconName), color: \(color))"
    }
}
