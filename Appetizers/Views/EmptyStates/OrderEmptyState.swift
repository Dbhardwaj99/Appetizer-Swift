//
//  OrderEmptyState.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 22/12/23.
//

import SwiftUI

struct OrderEmptyState: View {
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea(edges: .all)
            
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    OrderEmptyState(imageName: "empty-order", message: "Nothing here!")
}
