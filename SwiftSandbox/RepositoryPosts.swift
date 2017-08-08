//
//  RepositoryUsers.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 04/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit


class RepositoryPosts: NSObject {
    
    static let instance : RepositoryPosts = RepositoryPosts()
    
    public static func sharedInstance() -> RepositoryPosts {
        return instance
    }
    
    func getPosts() -> [Post] {
        var tempArrayPosts: [Post] = []
        _ = UtilityHttpRequest
            .getRequest(url: "https://jsonplaceholder.typicode.com/posts/1",
             completionHandler: { response in
                _ = response.map({  json in
                    let tempPost = Post(json: json)
                    tempArrayPosts += [tempPost]
                })
            },
            completionError: { error in
                print(error)
            });
        
        return tempArrayPosts
    }
}
