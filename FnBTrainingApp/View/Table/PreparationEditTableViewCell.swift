//
//  PreparationEditTableViewCell.swift
//  FnBTrainingApp
//
//  Created by Theofani on 26/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class PreparationEditTableViewCell: UITableViewCell {

    @IBOutlet weak var namaBahanLabel: UILabel!
    @IBOutlet weak var jumlahBahanLabel: UILabel!
    var myPersiapanModel: Preparation? {
        didSet{
            cellConfig()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfig(){
        guard let obj = myPersiapanModel else { return }
        namaBahanLabel.text = obj.name
        jumlahBahanLabel.text = obj.amount
    }
}
