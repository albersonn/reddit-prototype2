//
//  NetworkUtils.swift
//  reddit-prototype2
//
//  Created by Alberson Melo on 28/12/16.
//  Copyright © 2016 Alberson Melo. All rights reserved.
//

import Foundation

class NetworkUtils {
    func getDataFrom(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
