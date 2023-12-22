//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 21/12/23.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("🍔 Appetizer")
            }
            .onAppear{
                viewModel.getAppetizer()
            }
            
            if viewModel.isLoading{
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message
            )
        }
    }
}

#Preview {
    AppetizerListView()
}
