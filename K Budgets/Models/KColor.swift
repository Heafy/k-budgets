//
//  KColor.swift
//  K Budgets
//
//  Created by Jorge Martinez on 01/07/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class KColor {
    var red: Double
    var green: Double
    var blue: Double
    var opacity: Double

    init(red: Double, green: Double, blue: Double, opacity: Double = 1.0) {
        self.red = red
        self.green = green
        self.blue = blue
        self.opacity = opacity
    }

    var color: Color {
        Color(red: red, green: green, blue: blue, opacity: opacity)
    }

    func toColor() -> Color {
        return color
    }

    static func from(_ color: Color) -> KColor {
        let uiColor = UIColor(color)
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        return KColor(red: r, green: g, blue: b, opacity: a)
    }
}
