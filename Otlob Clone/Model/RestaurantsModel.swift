//
//  RestaurantsModel.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/11/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import ObjectMapper

class RestaurantsModel: Mappable
{
    
    var errorCode: String?
    var restaurants: [RestaurantsItemModel]?
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        
        errorCode <- map["errorCode"]
        restaurants <- map["restaurants"]
    }
}

class RestaurantsItemModel: Mappable
{
    var restaurant_id: Int?
    var restaurant_address: String?
    var restaurant_title : String?
    var restaurant_description: String?
    var lat: Double?
    var lng: Double?
    var delivery_fee: Float?
    var delivery_time_mins: Int?
    var restaurant_image_url_string : String?
    var restaurant_image : UIImage?
    var items: [ItemsModel]?
    var orders: [OrdersItemModel]?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map)
    {
        restaurant_id <- map["id"]
        restaurant_address <- map["address"]
        restaurant_title <- map["title"]
        restaurant_description <- map["description"]
        lat <- map["lat"]
        lng <- map["lng"]
        delivery_fee <- map["delivery_fee"]
        delivery_time_mins <- map["delivery_time_mins"]
        restaurant_image_url_string <- map["image"]
        if(restaurant_image_url_string != nil)
        {
            //conversion from base64 to UIImage
            let restaurant_image_url : URL = URL(string: restaurant_image_url_string!)!
            let imageData : NSData = NSData(contentsOf: restaurant_image_url as URL)!
            let str64 = imageData.base64EncodedData(options: .lineLength64Characters)
            let data : NSData = NSData(base64Encoded: str64, options: .ignoreUnknownCharacters)!
            restaurant_image = UIImage(data: data as Data)
            
        }
    }
    
    
}

class ItemsModel: Mappable
{
    var item_id : Int?
    var item_title : String?
    var item_description : String?
    var item_image_url_string : String?
    var item_price : Double?
    
    var item_image : UIImage?
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        item_id <- map["id"]
        item_title <- map["title"]
        item_description <- map["description"]
        item_image_url_string <- map["image"]
        item_price <- map["price"]
        
        if(item_image_url_string != nil)
        {
            let item_image_url : URL = URL(string: item_image_url_string!)!
            let imageData : NSData = NSData(contentsOf: item_image_url as URL)!
            let str64 = imageData.base64EncodedData(options: .lineLength64Characters)
            let data : NSData = NSData(base64Encoded: str64, options: .ignoreUnknownCharacters)!
            item_image = UIImage(data: data as Data)
        }
    }
    
    
}

class OrdersItemModel : Mappable
{
    var order_id : Int?
    var timestamp: String?
    var active: Bool?
    var order_by : [AuthenticationModel]?
    var ordered_items: [ItemsOrderedModel]?
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map)
    {
        order_id <- map["id"]
        timestamp <- map["timestamp"]
        active <- map["active"]
        order_by <- map["order_by"]
        ordered_items <- map["items"]
    }
    
    
}

class ItemsOrderedModel : Mappable
{
    var id: Int? //restaurant id
    var item_id: Int?
    var item_title : String?
    var item_description: String?
    var item_image_url_string: String?
    var item_image: UIImage?
    var item_price: Double?
    var item_QTY : Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        item_id <- map["item_id"]
        item_title <- map["title"]
        item_description <- map["description"]
        item_image_url_string <- map["image"]
        item_price <- map["price"]
        item_QTY <- map["qty"]
        if(item_image_url_string != nil)
        {
            let item_image_url : URL = URL(string: item_image_url_string!)!
            let imageData : NSData = NSData(contentsOf: item_image_url as URL)!
            let str64 = imageData.base64EncodedData(options: .lineLength64Characters)
            let data : NSData = NSData(base64Encoded: str64, options: .ignoreUnknownCharacters)!
            item_image = UIImage(data: data as Data)
        }
    }
}
