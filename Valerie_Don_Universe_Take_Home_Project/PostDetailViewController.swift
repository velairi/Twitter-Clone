//
//  PostDetailViewController.swift
//  Valerie_Don_Universe_Take_Home_Project
//
//  Created by Valerie Don on 7/23/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit

protocol PostDetailVCDelegate: class {
    func userDidTapProfileImageButton(_ userId: Int)
}

class PostDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var postUserID = Int()
    var postUsername = String()
    var postTitle = String()
    var postBody = String()
    var postID = Int()
    var commentData = [Comment]()
    weak var delegate: PostDetailVCDelegate?

    init(delegate: PostDetailVCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        navigationItem.title = "Tweet"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Comment.fetchComments(postID) { [weak self] comments in
            self?.commentData = comments
            self?.tableView.reloadData()
        }
    }
}

extension PostDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentData.count + 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! FeedTableViewCell
            cell.titleLabel.text = postTitle
            cell.bodyLabel.text = postBody
            cell.profileImageButton.tag = indexPath.row
            cell.usernameButton.setTitle(postUsername, for: .normal)
            cell.usernameButton.addTarget(self, action: #selector(profileImageButtonPressed(_:)), for: .touchUpInside)
            cell.profileImageButton.addTarget(self, action: #selector(profileImageButtonPressed(_:)), for: .touchUpInside)
            return cell
        } else if indexPath.row == 1 {
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CommentCellTitle")
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Comments"
            label.font = UIFont.boldSystemFont(ofSize: 25.0)
            label.textAlignment = .left
            label.textColor = .black

            cell.addSubview(label)

            let marginGuide = cell.layoutMarginsGuide
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: marginGuide.topAnchor),
                label.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
                label.heightAnchor.constraint(equalToConstant: 30),
                label.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor),
                label.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor)
                ])
            cell.separatorInset = UIEdgeInsets.zero

            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentTableViewCell
        let name = commentData[indexPath.row - 2].name
        let email = commentData[indexPath.row - 2].email
        cell.commenterInfoLabel.text = "Name: \(name)\nEmail: \(email)"
        cell.commentBodyLabel.text = commentData[indexPath.row - 2].body
        return cell
    }

    @objc func profileImageButtonPressed(_ sender: UIButton) {
        delegate?.userDidTapProfileImageButton(postUserID)
    }
}
