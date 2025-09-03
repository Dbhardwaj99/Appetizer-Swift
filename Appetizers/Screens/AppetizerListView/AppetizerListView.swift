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
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("Welcome \(viewModel.user.firstName)")
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear{
                viewModel.getAppetizer()
                viewModel.retriveUser()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail{
                AppetizerDetailView(isShowingDetail: $viewModel.isShowingDetail,
                                    appetizer: viewModel.selectedAppetizer!)
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
