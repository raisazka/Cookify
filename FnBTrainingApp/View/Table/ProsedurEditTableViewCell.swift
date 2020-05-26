//
//  ProsedurEditTableViewCell.swift
//  FnBTrainingApp
//
//  Created by Theofani on 26/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ProsedurEditTableViewCell: UITableViewCell {

    @IBOutlet weak var gambarProsedur: UIImageView!
    @IBOutlet weak var deskripsiProsedur: UILabel!
    
    var myProsedurModel: Prosedur? {
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
          guard let obj = myProsedurModel else { return }
        gambarProsedur.image = obj.gambar
        deskripsiProsedur.text = obj.deskripsi
      }
}
