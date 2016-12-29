//
//  UIImageViewExtension.swift
//  reddit-prototype2
//
//  Created by Alberson Melo on 29/12/16.
//  Copyright © 2016 Alberson Melo. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadFrom(url:URL, contentMode mode: UIViewContentMode) {
        contentMode = mode
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                self.image = nil
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                self.layoutSubviews()
            }
        }).resume()
    }
}
