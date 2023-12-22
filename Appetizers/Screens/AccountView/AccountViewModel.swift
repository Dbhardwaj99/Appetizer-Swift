//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 22/12/23.
//

import SwiftUI

final class AccountViewModel: ObservableObject{
    @Published var alertItem: AlertItem?
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var extraNapkin = false
    @Published var reFills = false
    
    var isValidForm: Bool{
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.isFieldEmpty
            return false
        }
        
        guard email.isValidEmail else{
            alertItem = AlertContext.isEmailValid
            return false
        }
        
        return true
    }
    
    func saveChanges(){
        guard isValidForm else { return }
        
        print("Changes have been saved succesfully!")
    }
}
