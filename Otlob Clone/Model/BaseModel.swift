//
//  BaseModel.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/11/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import ObjectMapper

class BaseModel: Mappable {
    var errorCode : Int?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        errorCode <- map["errorCode"]
    }
    

}
