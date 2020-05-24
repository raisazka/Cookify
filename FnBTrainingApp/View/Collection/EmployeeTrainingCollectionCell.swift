//
//  EmployeeTrainingCollectionCell.swift
//  FnBTrainingApp
//
//  Created by Rais on 20/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class EmployeeTrainingCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var trainingImage: UIImageView!
    @IBOutlet weak var trainingName: UILabel!
    
    override func awakeFromNib() {
        trainingImage.layer.cornerRadius = 5
        trainingImage.clipsToBounds = true
        trainingName.lineBreakMode = .byWordWrapping
        trainingName.numberOfLines = 0
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.masksToBounds = true
    }
    
    func configure(training: Training) {
        trainingName.text = training.name
        trainingImage.image = training.image
    }
}
