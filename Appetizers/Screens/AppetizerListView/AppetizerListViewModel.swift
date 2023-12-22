//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 22/12/23.
//

import Foundation
import SwiftUI

final class AppetizerListViewModel: ObservableObject{
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    func getAppetizer(){
        isLoading = true
        NetworkManager.shared.getAppetizers{result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error{
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    case .unableToDecode:
                        alertItem = AlertContext.unableToDecode
                    }
                }
            }
        }
    }
}