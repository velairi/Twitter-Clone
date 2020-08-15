//
//  AuthorPostsViewController.swift
//  Valerie_Don_Universe_Take_Home_Project
//
//  Created by Valerie Don on 7/25/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit

class AuthorPostsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var authorPosts = [Post]()
    var userId = Int()
    var username = String()

    init(_ userId: Int, _ data: [Post]) {
        authorPosts = data
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        navigationItem.title = username
        filterPostsByUserId()
    }

    func filterPostsByUserId() {
        let filtered = authorPosts.filter ({$0.userId == userId})
        authorPosts = filtered
    }
}

extension AuthorPostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return authorPosts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! FeedTableViewCell
        cell.separatorInset = UIEdgeInsets.zero
        cell.usernameButton.setTitle(username, for: .normal)
        cell.titleLabel.text = authorPosts[indexPath.row].title
        cell.bodyLabel.text = authorPosts[indexPath.row].body
        return cell
    }
}
