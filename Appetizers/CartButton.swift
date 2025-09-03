
import SwiftUI

struct CartButton: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "bag.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(Color("brandPrimary"))
            
            if order.items.count > 0 {
                Text("\(order.items.count)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(x: 10, y: -10)
            }
        }
    }
}

#Preview {
    CartButton()
        .environmentObject(Order())
}
