//
//  ContentView.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 21/12/23.
//

import SwiftUI

struct AppetizerTabView: View {
    @State private var isOrderViewPresented = false
    @State private var selectedTab = 0

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab){
                AppetizerListView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0)
                
                OrderHistoryView()
                    .tabItem {
                        Image(systemName: "clock.arrow.circlepath")
                        Text("History")
                    }
                    .tag(1)
                
                AccountView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Account")
                    }
                    .tag(2)
            }
            .accentColor(Color("brandPrimary"))
            
            if selectedTab == 0 {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            isOrderViewPresented = true
                        }) {
                            CartButton()
                        }
                        .padding(.trailing, 25)
                        .padding(.bottom, 75)
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $isOrderViewPresented) {
            OrderView(isShowingDetail: $isOrderViewPresented)
        }
    }
}

#Preview {
    AppetizerTabView()
}
