//
//  User.swift
//  Appetizers
//
//  Created by Divyansh Bhardwaj on 22/12/23.
//

import Foundation

struct User: Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var address = ""
    var birthday = Date()
    var extraNapkin = false
    var cutlery = false
}
