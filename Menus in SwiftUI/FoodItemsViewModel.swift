//
//  FoodItemsViewModel.swift
//  Menus in SwiftUI
//
//  Created by Stewart Lynch on 2020-09-24.
//

import Foundation

class FoodItemsViewModel:ObservableObject  {
    enum SortOrder:String {
        case name,
             foodgroup = "food group",
             calorieCount = "calorie count"
    }
    @Published var foodItems:[FoodItem]
    @Published var sortOrder:SortOrder
    init() {
        foodItems = FoodItem.sampleData
        sortOrder = .name
    }

    func matchingIndex(food:FoodItem) -> Int {
        foodItems.firstIndex{$0.id == food.id}!
    }

    var sortedFoodItems:[FoodItem] {
        switch sortOrder {
        case .name:
            return foodItems.sorted {$0.name < $1.name}
        case .foodgroup:
            return foodItems.sorted {$0.foodGroup.rawValue < $1.foodGroup.rawValue}
        case .calorieCount:
            return foodItems.sorted {$0.itemCalories > $1.itemCalories}
        }
    }
    
    var totalCalories: Double {
        foodItems.map{$0.quantity * Double($0.caloriesPerUnit)}.reduce(0,+)
    }
    
    var totalCaloriesDisplay: String {
        String(format: "%.0f", totalCalories)
    }

    func updateQuantity(idx: Int, qty: Double) {
        let id = sortedFoodItems[idx].id
        let realIndex = foodItems.firstIndex{$0.id == id}!
        foodItems[realIndex].quantity = qty
    }

    func deleteItem(food: FoodItem) {

        foodItems.remove(at: matchingIndex(food: food))

    }

}
