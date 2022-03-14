//
//  DownloadImageInCache.swift
//  SelfNewsApiMaking
//
//  Created by Kyungyun Lee on 14/03/2022.
//

import Foundation
import SwiftUI

class DownloadImageInCache {
    
    static let instance = DownloadImageInCache()
    
    private init() {
        
    }
    
    var photoCache : NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.totalCostLimit = 1024*1024*200
        cache.countLimit = 200
        return cache
    }() //컴퓨티드 프로퍼티로 계산한 후에 다시 뱉어준다.
    
    func add(key: String, value: UIImage) {
        photoCache.setObject(value, forKey: key as NSString)
    }
    
    func get(key : String) -> UIImage? {
        return photoCache.object(forKey: key as NSString)
    }
    
}

