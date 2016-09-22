//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Patrick Hansen on 9/20/16.
//  Copyright © 2016 Patrick Hansen. All rights reserved.
//

import Foundation

enum Method: String {
    case interestingPhotos = "flickr.interestingness.getList"
}

struct FlickrAPI {
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let apiKey = "a6d819499131071f158fd740860a5a88"
    
    private static func flickrURL(method: Method, parameters: [String:String]?) -> NSURL {
        
        // Build URL from components.
        let components = NSURLComponents(string: baseURLString)
        
        // Place to store N query items.
        var queryItems = [NSURLQueryItem]()
        
        // Init and add base params that will go with all queries.
        let baseParams = [
            "method": method.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": apiKey
        ]
        
        for (key, value) in baseParams {
            let item = NSURLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        // If there are addt'l params, add them too.
        if let addtlParams = parameters {
            for (key, value) in addtlParams {
                let item = NSURLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        // Finish building URL and return.
        components!.queryItems = queryItems
        
        return components!.URL!
    }
    
    static var interestingPhotosURL: NSURL {
        return flickrURL(.interestingPhotos, parameters: ["extras": "url_h,date_taken"]);
    }
}