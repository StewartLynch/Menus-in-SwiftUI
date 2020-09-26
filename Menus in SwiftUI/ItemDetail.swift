//
//  ItemDetail.swift
//  Menus in SwiftUI
//
//  Created by Stewart Lynch on 2020-09-23.
//

import SwiftUI

struct ItemDetail: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var foodItemsVM:FoodItemsViewModel
    var food:FoodItem
    @State var quantity:String = ""
    @State private var index = 0
    var body: some View {
        NavigationView {
            VStack() {
                Text(food.foodName).font(.largeTitle)
                Text(food.foodGroup.stringValue)
                HStack {
                    TextField("Enter Quantity", text: $quantity).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 75)
                    Text("Unit: \(food.unitType)")
                }
                Text(food.calorieCount)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .navigationTitle("Food Item")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Menu("Action") {
                        Section {
                            Button(action: {
                                foodItemsVM.foodItems[index].quantity = Double(quantity)!
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Label("Update", systemImage: "pencil")
                            }
                            Button(action: {
                                foodItemsVM.foodItems.remove(at: foodItemsVM.matchingIndex(food: food))
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        Section {
                            Menu("Cancel") {
                                Button(action: {
                                    
                                }) {
                                    Label("Return", systemImage: "return")
                                }
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Label("Dismiss", systemImage: "arrowshape.turn.up.backward")
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            index = foodItemsVM.foodItems.firstIndex {$0.id == food.id}!
            quantity = foodItemsVM.foodItems[index].quantityDisplay
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var food = FoodItem.sampleData[1]
    static var previews: some View {
        ItemDetail(foodItemsVM: FoodItemsViewModel(), food: food)
    }
}

