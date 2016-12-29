//
//  Post.swift
//  reddit-prototype2
//
//  Created by Alberson Melo on 28/12/16.
//  Copyright © 2016 Alberson Melo. All rights reserved.
//

import Foundation

class Link {
    
    let id: String
    let subreddit: String
    let author: String
    let name: String
    let over18: Bool
    let ups: UInt64
    let downs: UInt64
    let url: String
    let title: String
    let score: UInt64
    let thumbnail: String
    
    init?(json: [String: Any]) {
        guard
            let id = json["id"] as? String,
            let subreddit = json["subreddit"] as? String,
            let author = json["author"] as? String,
            let name = json["name"] as? String,
            let over18 = json["over_18"] as? Bool,
            let ups = json["ups"] as? UInt64,
            let downs = json["downs"] as? UInt64,
            let url = json["url"] as? String,
            let title = json["title"] as? String,
            let score = json["score"] as? UInt64,
            let thumbnail = json["thumbnail"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.subreddit = subreddit
        self.author = author
        self.name = name
        self.over18 = over18
        self.ups = ups
        self.downs = downs
        self.url = url
        self.title = title
        self.score = score
        self.thumbnail = thumbnail
    }
}
