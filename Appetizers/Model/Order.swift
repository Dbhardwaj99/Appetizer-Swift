//
//  Order.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 22/12/23.
//

import SwiftUI

final class Order: ObservableObject{
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double{
        items.reduce(0) {$0 + $1.price}
    }
}


