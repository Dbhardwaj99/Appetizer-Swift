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
                    TextField("First Name", text: $ViewModel.user.firstName)
                    TextField("Last Name", text: $ViewModel.user.lastName)
                    TextField("Email", text: $ViewModel.user.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                    TextField("Address", text: $ViewModel.user.address)
                    DatePicker("Birthday",
                               selection: $ViewModel.user.birthday,
                               displayedComponents: .date)
                    
                    Button{
                        ViewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Additional Prefrences")){
                    Toggle("Extra Napkins", isOn: $ViewModel.user.extraNapkin)
                    Toggle("Additional Cutlery", isOn: $ViewModel.user.cutlery)
                }
                .toggleStyle(SwitchToggleStyle(tint: Color("brandPrimary")))
            }
            .navigationTitle("👥 Accounts")
        }
        .onAppear{
            ViewModel.retriveUser()
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
