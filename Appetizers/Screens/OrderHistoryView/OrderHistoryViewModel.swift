import SwiftUI

class OrderHistoryViewModel: ObservableObject {
    @Published var orders: [Order] = []
    private let defaults = UserDefaults.standard

    init() {
        loadOrders()
    }

    func addOrder(_ order: Order) {
        orders.append(order)
        saveOrders()
    }

    private func saveOrders() {
        if let encoded = try? JSONEncoder().encode(orders) {
            defaults.set(encoded, forKey: "savedOrders")
        }
    }

    private func loadOrders() {
        if let savedOrders = defaults.object(forKey: "savedOrders") as? Data {
            if let decodedOrders = try? JSONDecoder().decode([Order].self, from: savedOrders) {
                orders = decodedOrders
            }
        }
    }
}
