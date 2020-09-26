//
//  FoodItem.swift
//  Menus in SwiftUI
//
//  Created by Stewart Lynch on 2020-09-23.
//

import Foundation

struct FoodItem: Identifiable {
    enum FoodGroup: String {
        case vegetable
        case fruit
        case grain
        case dairy
        case protein
        var stringValue: String {
            self.rawValue.capitalized
        }
    }

    var id = UUID()
    let name: String
    let nameEmoji: String
    let foodGroup: FoodGroup
    let unitType: String
    let caloriesPerUnit: Int
    var quantity: Double

    var foodName: String {
        "\(nameEmoji) \(name)"
    }
    var calorieCount: String {
        "1 \(unitType) = \(caloriesPerUnit) calories"
    }

    var quantityDisplay: String {
        String(format: "%.2f", quantity)
    }

    var foodGroupDisplay: String {
        foodGroup.stringValue
    }

    var itemCalories: Double {
        quantity * Double(caloriesPerUnit)
    }

    var itemCaloriesDisplay: String {
        String(format: "%.0f", itemCalories) + " calories"
    }



    static var sampleData:[FoodItem] {
        [
            FoodItem(name: "broccoli", nameEmoji: "🥦", foodGroup: .vegetable, unitType: "cup", caloriesPerUnit: 51, quantity: 1),
            FoodItem(name: "bread (whole wheat)", nameEmoji: "🍞", foodGroup: .grain, unitType: "slice", caloriesPerUnit: 68, quantity: 2),
            FoodItem(name: "cheese (cheddar)", nameEmoji: "🧀", foodGroup: .dairy, unitType: "cup", caloriesPerUnit: 440, quantity: 0.25),
            FoodItem(name: "pasta (spaghetti)", nameEmoji: "🍝", foodGroup: .grain, unitType: "cup", caloriesPerUnit: 197, quantity: 1),
            FoodItem(name: "carrots", nameEmoji: "🥕", foodGroup: .vegetable, unitType: "cup", caloriesPerUnit: 54, quantity: 1),
            FoodItem(name: "corn", nameEmoji: "🌽", foodGroup: .vegetable, unitType: "cup", caloriesPerUnit: 176, quantity: 1),
            FoodItem(name: "cucumber", nameEmoji: "🥒", foodGroup: .vegetable, unitType: "cup", caloriesPerUnit: 119, quantity: 1),
            FoodItem(name: "fish", nameEmoji: "🐠", foodGroup: .protein, unitType: "oz", caloriesPerUnit: 52, quantity: 3),
            FoodItem(name: "milk", nameEmoji: "🥛", foodGroup: .dairy, unitType: "cup", caloriesPerUnit: 146, quantity: 1),
            FoodItem(name: "apples", nameEmoji: "🍎", foodGroup: .fruit, unitType: "medium", caloriesPerUnit: 80, quantity: 1),
            FoodItem(name: "steak", nameEmoji: "🥩", foodGroup: .protein, unitType: "oz", caloriesPerUnit: 73, quantity: 6),
            FoodItem(name: "oranges", nameEmoji: "🟠", foodGroup: .fruit, unitType: "medium", caloriesPerUnit: 62, quantity: 1),
            FoodItem(name: "peaches", nameEmoji: "🍑", foodGroup: .fruit, unitType: "medium", caloriesPerUnit: 60, quantity: 1),
            FoodItem(name: "peanuts", nameEmoji: "🥜", foodGroup: .protein, unitType: "cup", caloriesPerUnit: 800, quantity: 0.25),
            FoodItem(name: "rice", nameEmoji: "🍚", foodGroup: .grain, unitType: "cup", caloriesPerUnit: 0168, quantity: 1),
            FoodItem(name: "taco", nameEmoji: "🌮", foodGroup: .grain, unitType: "shell", caloriesPerUnit: 14, quantity: 2),
            FoodItem(name: "chicken (breast-grilled)", nameEmoji: "🐓", foodGroup: .protein, unitType: "oz", caloriesPerUnit: 43, quantity: 4),
            FoodItem(name: "yogurt", nameEmoji: "🍦", foodGroup: .dairy, unitType: "cup", caloriesPerUnit: 154, quantity: 1),
            FoodItem(name: "bananas", nameEmoji: "🍌", foodGroup: .fruit, unitType: "medium", caloriesPerUnit: 118, quantity: 1)
        ]

    }
}
