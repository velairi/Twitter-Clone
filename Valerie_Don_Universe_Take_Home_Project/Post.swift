//
//  Post.swift
//  Valerie_Don_Universe_Take_Home_Project
//
//  Created by Valerie Don on 7/23/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit
import Alamofire

class Post {

    var userId: Int
    var id: Int
    var title: String
    var body: String

    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }

    class func fetchPosts(completion: @escaping ([Post]) -> Void) {
        AF.request("https://jsonplaceholder.typicode.com/posts", method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let JSON = value as? [[String: Any]] {
                    let posts = parseResponse(JSON)
                    completion(posts)
                }
            case .failure(let error): break
                // error handling
                completion([])
            }
        }
    }

    class func parseResponse(_ response: [[String: Any]]) -> [Post] {
        var posts = [Post]()
        for element in response {
            guard let userId = element["userId"] as? Int,
                let id = element["id"] as? Int,
                let title = element["title"] as? String,
                let body = element["body"] as? String else { continue }
            let post = Post(userId: userId, id: id, title: title, body: body)
            posts.append(post)
        }
        return posts
    }
}
