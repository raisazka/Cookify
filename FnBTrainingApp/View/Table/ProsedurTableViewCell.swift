//
//  ProsedurTableViewCell.swift
//  FnBTrainingApp
//
//  Created by Nathanael Adolf Sukiman on 20/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ProsedurTableViewCell: UITableViewCell {

    @IBOutlet weak var prosedurImage: UIImageView!
    @IBOutlet weak var prosedurLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
