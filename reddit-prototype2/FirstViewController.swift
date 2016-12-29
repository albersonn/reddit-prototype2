//
//  FirstViewController.swift
//  reddit-prototype2
//
//  Created by Alberson Melo on 28/12/16.
//  Copyright © 2016 Alberson Melo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource {

    @IBAction func fetchApi() {
        links.removeAll()
        tableView?.reloadData()
        
        RedditApi().getFrontPage(handler: asyncHandler)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var links: Array<Link> = []
    
    func asyncHandler(data:Data?, response:URLResponse?, error: Error?) {
        if let data = data {
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any] {
                if let children = (json["data"] as? [String: Any])?["children"] as? [[String: Any]] {
                    for child in children {
                        let kind = child["kind"] as! String
                        if (kind == "t3") {
                            if let link = Link(json: child["data"] as! [String : AnyObject]) {
                                links.append(link)
                            }
                        }
                    }
                }
            }
            tableView?.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "linkcell") as! LinkTableCell
        let link = links[indexPath.row]
        cell.linkLabel.text = link.url
        cell.titleLabel.text = link.title
        cell.poitsLabel.text = "\(link.ups) upvotes"
        
        if let url = URL(string: link.thumbnail) {
            cell.thumbView.downloadFrom(url: url, contentMode: UIViewContentMode.scaleAspectFit)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count
    }

}

