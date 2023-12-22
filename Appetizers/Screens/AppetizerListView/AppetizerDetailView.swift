//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 22/12/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    @Binding var isShowingDetail: Bool
    let appetizer: Appetizer
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40){
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            Spacer()
            Button{
                print("Tapped")
            }label: {
                APButton(title: "₹\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button{
            isShowingDetail = false
        }label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(isShowingDetail: .constant(true), appetizer: MockData.sampleAppetizer)
}


struct NutritionInfo: View{
    let title: String
    let value: Int
    
    var body: some View{
        VStack(spacing: 5){
            Text(title)
                .font(.caption)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("\(value)")
                .foregroundStyle(Color(.secondaryLabel))
                .fontWeight(.semibold)
                .italic()
        }
    }
}
