//
//  CommentTableViewCell.swift
//  Valerie_Don_Universe_Take_Home_Project
//
//  Created by Valerie Don on 7/26/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var commenterInfoLabel: UILabel!
    @IBOutlet weak var commentBodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.separatorInset = UIEdgeInsets.zero
    }
}
