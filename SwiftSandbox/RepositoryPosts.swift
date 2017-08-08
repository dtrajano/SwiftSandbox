//
//  RepositoryUsers.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 04/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit
import RxSwift


class RepositoryPosts: NSObject {
    
    static let instance : RepositoryPosts = RepositoryPosts()
    
    public static func sharedInstance() -> RepositoryPosts {
        return instance
    }
    
    func getPosts2(take: Int) -> Observable<String> {
        return Observable<String>.create({ (observer) in
            observer.onNext("Deu fogo!")
            return Disposables.create()
        })
    }
    
    func getPosts() {
//        return Observable<[Post]>.create({ (observer) in
//            
//        })
        var tempArrayPosts: [Post] = []
        _ = UtilityHttpRequest
            .getRequest(url: "https://jsonplaceholder.typicode.com/posts/",
             completionHandler: { response in
                _ = response.flatMap({ json in
                    //Post(json: json)
                    
                })
                
                //print(tempArrayPosts)
            },
            completionError: { error in
                print(error)
            });
    }
}
