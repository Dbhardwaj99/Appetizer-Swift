//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 21/12/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
