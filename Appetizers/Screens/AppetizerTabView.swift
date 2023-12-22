//
//  ContentView.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 21/12/23.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    AppetizerTabView()
}
