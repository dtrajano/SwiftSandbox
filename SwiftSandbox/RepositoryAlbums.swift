//
//  RepositoryMusics.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 09/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit
import RxSwift

class RepositoryAlbums: NSObject {
    static let instance : RepositoryAlbums = RepositoryAlbums()
    
    public static func sharedInstance() -> RepositoryAlbums {
        return instance
    }
    
    public func getAlbums() -> Observable<[Album]> {
        return Observable<[Album]>.create({ (observer) in
            _ = UtilityHttpRequest.getRequestResponseData(url: "https://itunes.apple.com/lookup?id=909253&entity=album").subscribe(
                onNext: { resultado in
                    let array = [Album](dictionaryArray: (resultado["results"] as? [NSDictionary])!)
                    observer.onNext(array)
            },
                onError:{ erro in
                    observer.onError(erro)
            })
            
            return Disposables.create()
        })
    }
}
