//
//  AuthenticationBusiness.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/12/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import ObjectMapper

class AuthenticationBusiness: BaseBusiness
{
    func login(withEmail email: String,
               andPassword password: String,
               andCompletionHandler completionHandler: @escaping (_ authenticationModel: AuthenticationModel?,_ errorModel: ErrorModel?) -> ())
    {
        let parameters = ["email": email, "password": password]
        let url = Constants.APIURL.rawValue + Constants.loginExtension.rawValue
        
        NetworkManager().createRequest(url: url, method: .post, params: parameters) { (response) in
            
            print(response.debugDescription)
            
            let error = self.handleError(response: response)
            
            if error == nil
            {
                let authenticationModel = Mapper<AuthenticationModel>().map(JSONObject: response.result.value)
                completionHandler(authenticationModel,nil)
            }
            else
            {
                completionHandler(nil, error)
            }
            
        }
    }
    
    func register(withUsername username: String ,
                  andPassword password: String,
                  andPhone phone: String,
                  andEmail email: String,
                  andAddress address: String,
                  andOwner owner: Bool,
                  andCompletionHandler completionHandler: @escaping (_ baseModel: BaseModel?,_ errorModel: ErrorModel?) -> ())
    {
        let url = Constants.APIURL.rawValue + Constants.registerExtension.rawValue
        let parameters = ["username": username,
                          "password": password,
                          "phone": phone,
                          "email": email,
                          "address": address,
                          "owner": owner] as [String : Any]
        NetworkManager().createRequest(url: url, method: .post, params: parameters) { (response) in
            
            print(response.debugDescription)
            
            let error = self.handleError(response: response)
            
            if error == nil
            {
                let baseModel = Mapper<BaseModel>().map(JSONObject: response.result.value)
                completionHandler(baseModel, nil)
            }
            else
            {
                completionHandler(nil, error)
            }
            
        }
    }
}
