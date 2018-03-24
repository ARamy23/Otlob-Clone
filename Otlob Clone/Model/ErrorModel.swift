//
//  ErrorModel.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/11/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import ObjectMapper

class ErrorModel
{
    var errorCode: Int
    var errorMsg: String?
    
    init(errorCode: Int) {
        self.errorCode = errorCode
        self.setMsg()
    }
    
    func setMsg()
    {
        switch errorCode {
        case -100:
            self.errorMsg = "Internal Server Error\nPlease Try again later..."
        case -101:
            self.errorMsg = "Please Ensure that you've entered information in all fields"
        case -102:
            self.errorMsg = "Username or Password doesn't match anything on our data...\nyou sure you registered nigga ?"
        case -103:
            self.errorMsg = "That email is right there in the database, already in use B"
        case -104:
            self.errorMsg = "Items IDs count doesn't match items QTYs count (This is a developing bug, don't mind it\n.\n.\n.\nUnless you fucked something up in the app then am gonna come and smack yo head in your precious iPhone screen !)"
        default:
            self.errorMsg = "Oops ... something went wrong\nError Code: \(errorCode)"
        }
    }
}
