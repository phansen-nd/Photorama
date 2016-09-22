//
//  PhotoStore.swift
//  Photorama
//
//  Created by Patrick Hansen on 9/21/16.
//  Copyright © 2016 Patrick Hansen. All rights reserved.
//

import Foundation

class PhotoStore {
    
    private var session: NSURLSession {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config)
    }
    
    func fetchInterestingPhotos() {
        let url = FlickrAPI.interestingPhotosURL
        let request = NSURLRequest(URL: url)
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            if let jsonData = data {
                if let jsonString = String(data: jsonData, encoding: NSUTF8StringEncoding) {
                    print(jsonString)
                }
            } else if let requestError = error {
                print("Error fetching interesting photos: \(requestError)")
            } else {
                print("Unexpected error with request.")
            }
        }
        task.resume()
    }
    
}