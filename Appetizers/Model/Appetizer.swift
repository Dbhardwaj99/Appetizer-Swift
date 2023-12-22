//
//  Appertizers.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 22/12/23.
//

import Foundation

struct Appetizer: Decodable, Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable{
    let request: [Appetizer]
}

struct MockData{
    static let sampleAppetizer = Appetizer(
        id: 01,
        name: "French Fires",
        description: "Potato sticks, deep friend until golder brown, highly overrated",
        price: 60.6,
        imageURL: "",
        calories: 80,
        protein: 20,
        carbs: 32
    )
    
    static let orderDataOne = Appetizer(
        id: 01,
        name: "French Fires",
        description: "Potato sticks, deep friend until golder brown, highly overrated",
        price: 60.6,
        imageURL: "",
        calories: 80,
        protein: 20,
        carbs: 32
    )
    
    static let orderDataTwo = Appetizer(
        id: 02,
        name: "German Fires",
        description: "Potato sticks, deep friend until golder brown, highly overrated",
        price: 60.6,
        imageURL: "",
        calories: 80,
        protein: 20,
        carbs: 32
    )
    
    static let orderDataThree = Appetizer(
        id: 03,
        name: "Indian Fires",
        description: "Potato sticks, deep friend until golder brown, highly overrated",
        price: 60.6,
        imageURL: "",
        calories: 80,
        protein: 20,
        carbs: 32
    )
    
    static let sampleAppetizerArray = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    static let sampleOrderArray = [orderDataOne, orderDataTwo, orderDataThree]
}
