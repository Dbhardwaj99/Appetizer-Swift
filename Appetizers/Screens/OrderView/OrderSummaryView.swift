//
//  OrderSummaryView.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 23/12/23.
//

import SwiftUI

struct OrderSummaryView: View {
    var address: String
    var firstName: String
    var ammounnt: Double
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text("Deliver to **\(firstName)**")
                Spacer()
            }
            .padding(.leading)
            HStack{
                Image(systemName: "house.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text("Delivery At **\(address)**")
                Spacer()
            }
            .padding(.leading)
            HStack{
                Image(systemName: "creditcard.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text("Total bill: **₹\(ammounnt, specifier: "%.2f")**")
                Spacer()
            }
            .padding(.leading)
        }
        .frame(width: 380, height: 125)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    OrderSummaryView(address: "Lohiya nagar, Katihar", firstName: "Divyansh", ammounnt: 33.2321)
}
