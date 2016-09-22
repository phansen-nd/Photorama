//
//  PhotoStore.swift
//  Photorama
//
//  Created by Patrick Hansen on 9/21/16.
//  Copyright © 2016 Patrick Hansen. All rights reserved.
//

import Foundation

enum PhotosResult {
    case success([Photo])
    case failuer(NSError)
}

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
                do {
                    let jsonObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
                    print(jsonObject)
                } catch let error {
                    print("Error creating JSON object: \(error)")
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