//
//  Photo.swift
//  Photorama
//
//  Created by Gilbert Lo on 1/22/18.
//  Copyright © 2018 Gilbert Lo. All rights reserved.
//

import Foundation

class Photo {
    
    let title: String
    let remoteURL: URL
    let photoId: String
    let dateTaken: Date
    
    init(title: String, photoId: String, remoteURL: URL, dateTaken: Date) {
        self.title = title
        self.photoId = photoId
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
    }
    
}

extension Photo: Equatable {
    static func ==(lhs: Photo, rhs: Photo) -> Bool {
        return lhs.photoId == rhs.photoId
    }
}
