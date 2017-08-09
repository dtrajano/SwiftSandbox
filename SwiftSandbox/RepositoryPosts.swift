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
    
    func getPostById(postId: Int) ->Observable<[Post]> {
        return Observable<[Post]>.create({ (observer) in
            _ = UtilityHttpRequest.getRequestResponseString(url: "https://jsonplaceholder.typicode.com/posts/" + String(postId)).subscribe(
                onNext: { resultado in
                    var posts: [Post] = []
                    posts += [Post(json: resultado)]
                    observer.onNext(posts)
            },
                onError:{ erro in
                    observer.onError(erro)
            })
            
            return Disposables.create()
        })
    }
    
    func getPosts() -> Observable<[Post]> {
        return Observable<[Post]>.create({ (observer) in
            _ = UtilityHttpRequest.getRequestResponseString(url: "https://jsonplaceholder.typicode.com/posts/").subscribe(
                onNext: { resultado in
                    observer.onNext([Post](json: resultado))
            },
                onError:{ erro in
                    observer.onError(erro)
            })
            
            return Disposables.create()
        })
    }
}
