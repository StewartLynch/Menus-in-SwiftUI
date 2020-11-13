//
//  ContentView.swift
//  Menus in SwiftUI
//
//  Created by Stewart Lynch on 2020-09-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var foodItemsVM = FoodItemsViewModel()
    @State private var selectedFood:FoodItem?
    var body: some View {
        NavigationView {
            VStack {
                Text("Total Calories: \(foodItemsVM.totalCaloriesDisplay)")
                    .font(.title)
                Menu {
                    Picker(selection: $foodItemsVM.sortOrder, label: Text("")) {
                        Text("Name").tag(FoodItemsViewModel.SortOrder.name)
                        Text("Food Group").tag(FoodItemsViewModel.SortOrder.foodgroup)
                        Text("Calorie Count").tag(FoodItemsViewModel.SortOrder.calorieCount)
                    }
                } label: {
                    Label("Sorted by \(foodItemsVM.sortOrder.rawValue)", systemImage: "arrow.up.arrow.down.circle.fill")
                        .font(.title2)
                }
                List {
                    ForEach(foodItemsVM.sortedFoodItems) { food in
                        Button(action: {
                            selectedFood = food
                        }) {
                            HStack(spacing: 5) {
                                VStack(alignment:.leading) {
                                    Text(food.foodName).font(.title)
                                    Text(food.foodGroupDisplay)
                                    Text(food.calorieCount)
                                }
                                Spacer()
                                VStack {
                                    Text("\(food.quantityDisplay) \(food.unitType)")
                                    Text(food.itemCaloriesDisplay)
                                }
                                .padding(.vertical,5)
                                .frame(width: 125)
                                .foregroundColor(Color(UIColor.secondarySystemBackground))
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color(UIColor.secondaryLabel))
                                )
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Food Intake")
                .padding(.vertical)
            }
            .fullScreenCover(item: $selectedFood) { selectedFood in
                ItemDetail(foodItemsVM: foodItemsVM,food: selectedFood)
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
