//
//  Order.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 22/12/23.
//

import SwiftUI

enum OrderStatus: String, Codable {
    case preparing = "Preparing"
    case onTheWay = "On the way"
    case delivered = "Delivered"
}

class Order: ObservableObject, Identifiable, Codable {
    @Published var items: [Appetizer] = []
    
    var id = UUID()
    var date = Date()
    
    var status: OrderStatus {
        let timeInterval = Date().timeIntervalSince(date)
        if timeInterval < 600 { // 10 minutes
            return .preparing
        } else if timeInterval < 1800 { // 30 minutes
            return .onTheWay
        } else {
            return .delivered
        }
    }
    
    var statusColor: Color {
        switch status {
        case .preparing:
            return .red
        case .onTheWay:
            return .yellow
        case .delivered:
            return .green
        }
    }
    
    var totalPrice: Double{
        items.reduce(0) {$0 + $1.price}
    }
    
    enum CodingKeys: String, CodingKey {
        case items, id, date
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([Appetizer].self, forKey: .items)
        id = try container.decode(UUID.self, forKey: .id)
        date = try container.decode(Date.self, forKey: .date)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(items, forKey: .items)
        try container.encode(id, forKey: .id)
        try container.encode(date, forKey: .date)
    }
    
    init() {}
}


