//
//  UtilityHttpRequest.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 04/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit
import Alamofire

class UtilityHttpRequest: NSObject {

    static func getRequest(url: String,
                           completionHandler: @escaping (DataResponse<Any>) -> Void,
                           completionError: @escaping (Error) -> Void) -> Alamofire.DataRequest {
        
        return Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success:
                DispatchQueue.main.async {
                    completionHandler(response)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completionError(error)
                }
            }
        }
    }
    
    static func getRequest(url: String,
                    method: HTTPMethod,
                    parameters: [String:Any],
                    encoding: ParameterEncoding,
                    completionHandler: @escaping (DataResponse<Any>) -> Void) -> Alamofire.DataRequest {
    
        return Alamofire.request(url).responseJSON { response in
            DispatchQueue.main.async {
                completionHandler(response)
            }
        }
    }
}
