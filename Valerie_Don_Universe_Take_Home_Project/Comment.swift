//
//  Comment.swift
//  Valerie_Don_Universe_Take_Home_Project
//
//  Created by Valerie Don on 7/25/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit
import Alamofire

class Comment {

    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String

    init(postId: Int, id: Int, name: String, email: String, body: String) {
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }

    class func fetchComments(_ postID: Int, completion: @escaping ([Comment]) -> Void) {
        var urlString = "https://jsonplaceholder.typicode.com/posts/" + "\(postID)" + "/comments"
        AF.request(urlString, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let JSON = value as? [[String: Any]] {
                    let comments = parseComments(JSON)
                    completion(comments)
                }
            case .failure(let error): break
            // error handling
            completion([])
            }
        }
    }

    class func parseComments(_ response: [[String: Any]]) -> [Comment] {
        var commentData = [Comment]()
        for element in response {
            guard let postId = element["postId"] as? Int,
                let id = element["id"] as? Int,
                let name = element["name"] as? String,
                let email = element["email"] as? String,
                let body = element["body"] as? String else { continue }
            let comment = Comment(postId: postId, id: id, name: name, email: email, body: body)
            commentData.append(comment)
        }
        return commentData
    }
}
