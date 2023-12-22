//
//  Alert.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 22/12/23.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton = Alert.Button.default(Text("OK"))
}

struct AlertContext{
    static let invalidURL = AlertItem(title: Text("Invalid API"),
                                      message: Text("API endpoint isn't working, Please check the codebase"))
                            
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid Response from the Server"))
    
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("Data recived was invalid, Please Check!"))
    
    static let unableToComplete = AlertItem(title: Text("Internel Server Error"),
                                            message: Text("There was some issue with connecting with the server, please check your internet connection"))
    
    static let unableToDecode = AlertItem(title: Text("Unable to Decode"),
                                          message: Text("Decoder object wasn't able to decode the JSON object, please check the format"))
}

