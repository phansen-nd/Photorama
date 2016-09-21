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
}