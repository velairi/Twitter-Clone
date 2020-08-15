//
//  FeedTableViewCell.swift
//  Valerie_Don_Universe_Take_Home_Project
//
//  Created by Valerie Don on 7/23/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var usernameButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageButton.isEnabled = true
        profileImageButton.backgroundColor = .clear
        profileImageButton.layer.cornerRadius = 5
        profileImageButton.layer.borderWidth = 1
        profileImageButton.layer.borderColor = UIColor.black.cgColor
        self.separatorInset = UIEdgeInsets.zero
        usernameButton.contentHorizontalAlignment = .left
        usernameButton.sizeToFit()
        usernameButton.titleLabel?.lineBreakMode = .byTruncatingTail
        usernameButton.titleLabel?.numberOfLines = 0

    }
}
