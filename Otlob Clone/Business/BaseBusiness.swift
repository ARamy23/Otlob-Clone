//
//  BaseBusiness.swift
//  Otlob Clone
//
//  Created by Ahmed Ramy on 3/11/18.
//  Copyright © 2018 Ahmed Ramy. All rights reserved.
//

import ObjectMapper
import Alamofire

class BaseBusiness
{
    func handleError(response: DataResponse<Any>) -> ErrorModel?
    {
        if response.result.isSuccess
        {
            let baseModel = Mapper<BaseModel>().map(JSONObject: response.result.value) //i dont understand this line
            
            if let errorCode = baseModel?.errorCode
            {
                if errorCode == 0
                {
                    return nil
                }
                
                let errorModel = ErrorModel(errorCode: errorCode)
                return errorModel
            }
            
        }
        
        let errorModel = ErrorModel(errorCode: -999)
        return errorModel
    }
}
