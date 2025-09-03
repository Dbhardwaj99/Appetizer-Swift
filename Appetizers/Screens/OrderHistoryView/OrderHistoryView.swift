import SwiftUI

struct OrderHistoryView: View {
    @StateObject var viewModel = OrderHistoryViewModel()

    var body: some View {
        NavigationView {
            ZStack{
                List(viewModel.orders) { order in
                    NavigationLink(destination: OrderMapView(order: order)) {
                        VStack(alignment: .leading) {
                            Text("Order ID: \(order.id.uuidString)")
                                .font(.caption)
                            Text("Date: \(order.date, formatter: DateFormatter.shortDate)")
                                .font(.caption)
                            Text("Total: $\(order.totalPrice, specifier: "%.2f")")
                                .bold()
                            HStack {
                                Text("Status:")
                                Text(order.status.rawValue)
                                    .foregroundColor(order.statusColor)
                            }
                        }
                    }
                }
                .navigationTitle("History")
                
                if viewModel.orders.isEmpty{
                    OrderEmptyState(imageName: "empty-order", message: "You have no items in your order😔.\n please add an appetizer🥺")
                }
            }
        }
    }
}

extension DateFormatter {
    static var shortDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
}

#Preview {
    OrderHistoryView()
}
