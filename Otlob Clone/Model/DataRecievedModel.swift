//
//  DataRecievedModel.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/12/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import ObjectMapper

class DataRecievedModel: BaseModel
{
    var restuarant_added_data: [RestaurantDataModel]?
    var restuarant_order_added_data: [BaseModel]?
    var restuarant_item_added_data: [RestaurantItemDataModel]?
    
    override func mapping(map: Map)
    {
        super.mapping(map: map)
        errorCode <- map["errorCode"]
        restuarant_added_data <- map["data"]
        restuarant_order_added_data <- map["data"]
        restuarant_item_added_data <- map["data"]
    }
}

class RestaurantDataModel : Mappable
{
    var restaurant_id: Int?
    var restaurant_title: String?
    var restaurant_description: String?
    var restaurant_image_url_string: String?
    var restaurant_image: UIImage?
    var restaurant_address: String?
    var lat: Double?
    var lng: Double?
    var delivery_fee: Float?
    var delivery_time_mins: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        restaurant_id <- map["id"]
        restaurant_title <- map["title"]
        restaurant_description <- map["description"]
        restaurant_image_url_string <- map["image"]
        restaurant_address <- map["address"]
        lat <- map["lat"]
        lng <- map["lng"]
        delivery_fee <- map["delivery_fee"]
        delivery_time_mins <- map["delivery_time_mins"]
        
        if(restaurant_image_url_string != nil)
        {
            let item_image_url : URL = URL(string: restaurant_image_url_string!)!
            let imageData : NSData = NSData(contentsOf: item_image_url as URL)!
            let str64 = imageData.base64EncodedData(options: .lineLength64Characters)
            let data : NSData = NSData(base64Encoded: str64, options: .ignoreUnknownCharacters)!
            restaurant_image = UIImage(data: data as Data)
        }
    }
}

class RestaurantItemDataModel : Mappable
{
    var order_id: Int?
    var order_title: String?
    var order_description: String?
    var order_image_url_string: String?
    var order_image: UIImage?
    var restaurant_id: Int?
    var order_price: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map)
    {
        order_id <- map["id"]
        order_title <- map["title"]
        order_description <- map["description"]
        order_image_url_string <- map["image"]
        restaurant_id <- map["restaurant_id"]
        order_price <- map["price"]
        
        if(order_image_url_string != nil)
        {
            let item_image_url : URL = URL(string: order_image_url_string!)!
            let imageData : NSData = NSData(contentsOf: item_image_url as URL)!
            let str64 = imageData.base64EncodedData(options: .lineLength64Characters)
            let data : NSData = NSData(base64Encoded: str64, options: .ignoreUnknownCharacters)!
            order_image = UIImage(data: data as Data)
        }
    }
    
    
    
    
}

