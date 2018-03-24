//
//  RestaurantsBusiness.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/12/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import ObjectMapper

class RestaurantsBusiness: BaseBusiness
{
    //MARK: -GET Methods
    func getRestaurants(completionHandler: @escaping (_ restaurantsModel: RestaurantsModel?,_ errorModel: ErrorModel?) ->())
    {
        let url = Constants.APIURL.rawValue + Constants.getRestaurantsExtension.rawValue
        
        NetworkManager().createRequest(url: url, method: .get, params: [:]) { (response) in
            let error = self.handleError(response: response)
            
            if error == nil
            {
                let restaurantsModel = Mapper<RestaurantsModel>().map(JSONObject: response.result.value)
                
                completionHandler(restaurantsModel, nil)
            }
            else
            {
                completionHandler(nil, error)
            }
        }
    }
    func getRestaurantOrders(owner_id: Int, completionHandler: @escaping (_ ordersItemModel: RestaurantsModel?,_ errorModel: ErrorModel?) ->())
    {
        let url = Constants.APIURL.rawValue + Constants.getRestaurantOrdersExtension.rawValue
        let parameters = ["id":  owner_id]
        
        NetworkManager().createRequest(url: url, method: .get, params: parameters) { (response) in
            let errorModel = self.handleError(response: response)
            
            if errorModel == nil
            {
                let ordersItemModel = Mapper<RestaurantsModel>().map(JSONObject: response.result.value)
                completionHandler(ordersItemModel, nil)
            }
            else
            {
                completionHandler(nil , errorModel)
            }
        }
    }
    
    //MARK: -POST Methods
    func addRestaurant(title: String, description: String, image: UIImage, address: String, lat: Double, lng: Double,
                       delivery_fee: Float, delivery_time_mins: Int, owner_id: Int,
                       completionHandler: @escaping(_ baseModel: BaseModel?,_ errorModel: ErrorModel?) -> ())
    {
        let imageData: NSData = UIImagePNGRepresentation(image)! as NSData
        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        let url = Constants.APIURL.rawValue + Constants.addRestaurantExtension.rawValue
        let params = ["title" : title, "description" : description, "image": strBase64, "address": address , "lat" : lat , "lng" : lng,
                      "delivery_fee": delivery_fee, "delivery_time_mins": delivery_time_mins, "owner_id": owner_id] as [String : Any]
        NetworkManager().createRequest(url: url, method: .post, params: params) { (response) in
            let errorModel = self.handleError(response: response)
            if errorModel == nil
            {
                let dataRecievedModel = Mapper<BaseModel>().map(JSONObject: response.result.value)
                completionHandler(dataRecievedModel, nil)
            }
            else
            {
                completionHandler(nil , errorModel)
            }
        }
    }
    
    func addItemInRestaurant(title: String, description: String,price: Float, image: UIImage, restaurant_id: Int,
                             completionHandler: @escaping(_ baseModel: BaseModel?,_ errorModel: ErrorModel?) -> ())
    {
        let imageData: NSData = UIImagePNGRepresentation(image)! as NSData
        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        let url = Constants.APIURL.rawValue + Constants.addItemExtension.rawValue
        let params : [String: Any] = ["title": title, "description": description, "price" : price, "image": strBase64, "restaurant_id" : restaurant_id]
        
        NetworkManager().createRequest(url: url, method: .post, params: params) { (response) in
            let errorModel = self.handleError(response: response)
            if errorModel == nil
            {
                let dataRecievedModel = Mapper<BaseModel>().map(JSONObject: response.result.value)
                completionHandler(dataRecievedModel, nil)
            }
            else
            {
                completionHandler(nil , errorModel)
            }
        }
    }
    
    func addOrder(restaurant_id: Int, order_by: Int, items_ids: [Int], items_qtys: [Int],
                  completionHandler: @escaping(_ baseModel: BaseModel?,_ errorModel: ErrorModel?) -> ())
    {
        let url = Constants.APIURL.rawValue + Constants.addOrderExtension.rawValue
        let params : [String: Any] = ["restaurant_id": restaurant_id, "order_by": order_by, "items_ids": items_ids, "items_qtys": items_qtys]
        
        NetworkManager().createRequest(url: url, method: .post, params: params) { (response) in
            let errorModel = self.handleError(response: response)
            if errorModel == nil
            {
                let dataRecievedModel = Mapper<BaseModel>().map(JSONObject: response.result.value)
                completionHandler(dataRecievedModel, nil)
            }
            else
            {
                completionHandler(nil , errorModel)
            }
        }
        
    }
}
