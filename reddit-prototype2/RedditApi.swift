//
//  RedditApi.swift
//  reddit-prototype2
//
//  Created by Alberson Melo on 28/12/16.
//  Copyright © 2016 Alberson Melo. All rights reserved.
//

import Foundation

class RedditApi {
    let baseUrl = "https://www.reddit.com"
    
    func getFrontPage(handler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        
        guard let url = URL(string: "\(baseUrl)/hot.json?limit=50") else {
            return;
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("br.com.alberson.reddit-client", forHTTPHeaderField: "User-Agent")
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: handler)
        task.resume()
    }
}
