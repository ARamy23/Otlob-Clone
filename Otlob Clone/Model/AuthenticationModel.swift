//
//  AuthenticationModel.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/11/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import ObjectMapper

class AuthenticationModel: BaseModel
{
    var id : Int?
    var username: String?
    var email: String?
    var phone: String?
    var address: String?
    var owner: Bool?
    
    override func mapping(map: Map)
    {
        super.mapping(map: map)
        id <- map["data.id"]
        username <- map["data.username"]
        email <- map["data.email"]
        phone <- map["data.phone"]
        address <- map["data.address"]
        owner <- map["data.owner"]
    }
}
