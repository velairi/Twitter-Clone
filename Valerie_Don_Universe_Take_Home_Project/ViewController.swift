//
//  ViewController.swift
//  Valerie_Don_Universe_Take_Home_Project
//
//  Created by Valerie Don on 7/23/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var postData = [Post]()
    var userIDToUsernameDict = [Int: String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        tableView.allowsSelection = true
        navigationItem.title = "Home"
        mapUserIdToUsername()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Post.fetchPosts() { [weak self] posts in
            self?.postData = posts
            self?.tableView.reloadData()
        }
    }

    func mapUserIdToUsername() {
        userIDToUsernameDict[1] = "Tim Cook"
        userIDToUsernameDict[2] = "Craig Federighi"
        userIDToUsernameDict[3] = "Natasha The Robot"
        userIDToUsernameDict[4] = "Sundar Pichai"
        userIDToUsernameDict[5] = "Steve Jobs"
        userIDToUsernameDict[6] = "Ada Lovelace"
        userIDToUsernameDict[7] = "Nisha Dua"
        userIDToUsernameDict[8] = "Susan Wojcicki"
        userIDToUsernameDict[9] = "Gavin Belson"
        userIDToUsernameDict[10] = "Richard Hendricks"
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! FeedTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.usernameButton.setTitle(userIDToUsernameDict[postData[indexPath.row].userId], for: .normal)
        cell.profileImageButton.titleLabel?.text = "\(postData[indexPath.row].userId)"
        cell.titleLabel.text = postData[indexPath.row].title
        cell.bodyLabel?.text = postData[indexPath.row].body
        cell.profileImageButton.tag = indexPath.row
        cell.usernameButton.tag = indexPath.row
        cell.usernameButton.addTarget(self, action: #selector(profileImageButtonPressed(_:)), for: .touchUpInside)
        cell.profileImageButton.addTarget(self, action: #selector(profileImageButtonPressed(_:)), for: .touchUpInside)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postDetailVC = PostDetailViewController(delegate: self)
        postDetailVC.postUserID = postData[indexPath.row].userId
        postDetailVC.postUsername = userIDToUsernameDict[postData[indexPath.row].userId] ?? ""
        postDetailVC.postTitle = postData[indexPath.row].title
        postDetailVC.postBody = postData[indexPath.row].body
        postDetailVC.postID = postData[indexPath.row].id
        self.navigationController?.pushViewController(postDetailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @objc func profileImageButtonPressed(_ sender: UIButton) {
        //code reuse
        let indexPath = sender.tag
        print(sender.tag)
        print(indexPath)
        let userId = postData[indexPath].userId
        print(userId)
        self.userDidTapProfileImageButton(userId)
    }
}

extension ViewController: PostDetailVCDelegate {
    func userDidTapProfileImageButton(_ userId: Int) {
        let authorPostsVC = AuthorPostsViewController(userId, postData)
        navigationController?.pushViewController(authorPostsVC, animated: true)
        authorPostsVC.userId = userId
        authorPostsVC.username = userIDToUsernameDict[userId] ?? ""
    }
}
