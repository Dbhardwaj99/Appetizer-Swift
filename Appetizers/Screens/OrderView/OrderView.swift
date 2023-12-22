//
//  OrderView.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 21/12/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    @State private var showingAlert = false
    @ObservedObject var ViewModel = AccountViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(InsetGroupedListStyle())
                    
                    Spacer()
                    
                    OrderSummaryView(address: ViewModel.user.address,
                                     firstName: ViewModel.user.firstName,
                                     ammounnt: order.totalPrice)
                    
                    Button{
                        print("Order Placed")
                        showingAlert = true
                        order.items.removeAll()
                    }label: {
                        APButton(title: "Order Now!")
                    }
                    .padding(.bottom, 30)
                    .alert(isPresented:$showingAlert) {
                        Alert(
                            title: Text("Order Placed!"),
                            message: Text("Chillax, We will deliver your order shortly to your address")
                        )
                    }
                }
                
                if order.items.isEmpty{
                    OrderEmptyState(imageName: "empty-order", message: "You have no items in your order😔.\n please add an appetizer🥺")
                }
            }
            .navigationTitle("🧾 Orders")
        }
        .onAppear{
            ViewModel.retriveUser()
        }
    }
    
    func deleteItems(at offesets: IndexSet){
        order.items.remove(atOffsets: offesets)
    }
}

#Preview {
    OrderView()
}
