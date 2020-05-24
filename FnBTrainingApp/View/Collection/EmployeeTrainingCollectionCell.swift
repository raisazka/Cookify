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
    @IBOutlet weak var trainingMinute: UILabel!
    
    override func awakeFromNib() {
        setBorder()
        setShadow()
        trainingName.lineBreakMode = .byWordWrapping
        trainingName.numberOfLines = 0
    }
    
    private func setBorder() {
        trainingImage.layer.cornerRadius = 10
        trainingImage.clipsToBounds = true
        layer.cornerRadius = 10.0
        layer.cornerRadius = 10.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.clear.cgColor
    }
    
    private func setShadow() {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.white.cgColor
    }
    
    func configure(training: Training) {
        trainingName.text = training.name
        trainingImage.image = training.image
        trainingMinute.text = "\(training.minute)min"
    }
}
