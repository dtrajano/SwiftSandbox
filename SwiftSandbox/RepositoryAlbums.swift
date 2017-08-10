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
    
    public func getAlbums(artistName: String) -> Observable<[Album]> {
        return Observable<[Album]>.create({ (observer) in
            _ = UtilityHttpRequest.getRequestResponseData(url: "https://itunes.apple.com/search?term=" + artistName).subscribe(
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
    
    public func getImageByAlbum(currentAlbum: Album) -> Observable<UIImage> {
        return Observable<UIImage>.create({ (observer) in
            _ = UtilityHttpRequest.getRequestResponseImage(url: currentAlbum.artworkUrl60).subscribe(
                onNext: { resultado in
                    observer.onNext(resultado as UIImage)
            })
            return Disposables.create()
        })
    }
}
