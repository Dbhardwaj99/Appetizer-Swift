//
//  AccountView.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 21/12/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var ViewModel = AccountViewModel()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $ViewModel.firstName)
                    TextField("Last Name", text: $ViewModel.lastName)
                    TextField("Email", text: $ViewModel.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    DatePicker("Birthday",
                               selection: $ViewModel.birthday,
                               displayedComponents: .date)
                    
                    Button{
                        ViewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Additional Prefrences")){
                    Toggle("Extra Napkins", isOn: $ViewModel.extraNapkin)
                    Toggle("Refills", isOn: $ViewModel.reFills)
                }
                .toggleStyle(SwitchToggleStyle(tint: Color("brandPrimary")))
            }
            .navigationTitle("👥 Accounts")
        }
        .alert(item: $ViewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message)
        }
    }
}

#Preview {
    AccountView()
}
