//
//  UtilityHttpRequest.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 04/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import RxSwift

class UtilityHttpRequest: NSObject {

    static func getRequestResponseImage(url: String) ->Observable<Image> {
        return Observable<Image>.create({ (observer) in
            getRequest(url: url).responseImage(completionHandler: { response in
                switch response.result {
                case .success:
                    observer.onNext(response.result.value!)
                case .failure(let error):
                    print(error)
                    observer.onNext(#imageLiteral(resourceName: "defaultImageAlbum"))
                }
            })
            return Disposables.create()
        })
    }
    
    static func getRequestResponseString(url: String) -> Observable<String> {
        return Observable<String>.create({ (observer) in
            getRequest(url: url).responseString(completionHandler: { response in
                switch response.result {
                case .success:
                    observer.onNext(response.result.value!)
                case .failure(let error):
                    observer.onError(error)
                }
            })
            return Disposables.create()
        })
    }
    
    static func getRequestResponseData(url: String) -> Observable<[String:Any]> {
        return Observable<[String:Any]>.create({ (observer) in
            _ = getRequest(url: url).responseJSON(completionHandler: { response in
                switch response.result {
                case .success:
                    observer.onNext(response.result.value as! [String:Any])
                case .failure(let error):
                    observer.onError(error)
                }
            })
            return Disposables.create()
        })
    }
    
//    private static func getRequest(url: String,
//                           completionHandler: @escaping (DataResponse<String>) -> Void,
//                           completionError: @escaping (Error) -> Void) -> Alamofire.DataRequest {
//        
//        return getRequest(url: url).responseString { response in
//            switch response.result {
//            case .success:
//                DispatchQueue.main.async {
//                    completionHandler(response)
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    completionError(error)
//                }
//            }
//        }
//    }
    
    private static func getRequest(url: String) -> DataRequest {
        return Alamofire.request(url)
    }
    
//    private static func getRequest(url: String,
//                    method: HTTPMethod,
//                    parameters: [String:Any],
//                    encoding: ParameterEncoding,
//                    completionHandler: @escaping (DataResponse<String>) -> Void) -> Alamofire.DataRequest {
//    
//        return Alamofire.request(url).responseString { response in
//            DispatchQueue.main.async {
//                completionHandler(response)
//            }
//        }
//    }
}
