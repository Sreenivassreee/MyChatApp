//
//  MessageCell.swift
//  MyChatApp
//
//  Created by Sreenivas k on 17/04/21.
//

import UIKit

class MessageCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubol.layer.cornerRadius = messageBubol.frame.size.height / 5
        // Initialization code
    }

    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var messageBubol: UIView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
