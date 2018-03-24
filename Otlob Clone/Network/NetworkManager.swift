//
//  NetworkManager.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/11/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import Alamofire
import ObjectMapper

class NetworkManager
{
    func createRequest(url: String,
                       method: HTTPMethod,
                       params: [String:Any],
                       completionHandler: @escaping (_ response: DataResponse<Any>) -> ())
    {
        let request = Alamofire.request(url, method: method, parameters: params)
        request.responseJSON { (response) in
            print(response.debugDescription)
            
            completionHandler(response)
        }
    }
}
