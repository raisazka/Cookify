//
//  MgMainTableViewCell.swift
//  FnBTrainingApp
//
//  Created by Nathanael Adolf Sukiman on 18/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

 class MgMainTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var assigneeImage: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
