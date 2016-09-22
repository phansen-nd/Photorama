//
//  Photo.swift
//  Photorama
//
//  Created by Patrick Hansen on 9/21/16.
//  Copyright © 2016 Patrick Hansen. All rights reserved.
//

import Foundation

class Photo {
    
    let title: String
    let remoteURL: NSURL
    let photoID: String
    let dateTaken: NSDate
    
    init(title: String, remoteURL: NSURL, photoID: String, dateTaken: NSDate) {
        self.title = title
        self.remoteURL = remoteURL
        self.photoID = photoID
        self.dateTaken = dateTaken
    }
}