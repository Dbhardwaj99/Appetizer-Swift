//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 22/12/23.
//

import SwiftUI

final class AccountViewModel: ObservableObject{
    @AppStorage("user") private var userData: Data?
    @Published var alertItem: AlertItem?
    
    @Published var user = User()
    
    var isValidForm: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty && !user.address.isEmpty else {
            alertItem = AlertContext.isFieldEmpty
            return false
        }
        
        guard user.email.isValidEmail else{
            alertItem = AlertContext.isEmailValid
            return false
        }
        
        return true
    }
    
    func saveChanges(){
        guard isValidForm else { return }
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSuccess
        }catch{
            alertItem = AlertContext.userError
        }
    }
    
    func retriveUser(){
        guard let userData = userData else { return }
        
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
        }catch{
            alertItem = AlertContext.userError
        }
    }
}
