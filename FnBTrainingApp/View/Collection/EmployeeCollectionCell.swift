//
//  EmployeeCollectionCell.swift
//  FnBTrainingApp
//
//  Created by Rais on 17/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

protocol EmpCellDelegate {
    func theSegue(data: Employee)
}

class EmployeeCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var empImage: UIImageView!
    @IBOutlet weak var empLabel: UILabel!
    @IBOutlet weak var empView: UIView!
    var employee : Employee?
    var empCellDelegate : EmpCellDelegate?
    
    override func awakeFromNib() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        empView.isUserInteractionEnabled = true
        empView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        empCellDelegate?.theSegue(data: employee!)
    }
    
    func configure(employee: Employee) {
        empImage.layer.borderWidth = 1
        empImage.layer.masksToBounds = false
        empImage.layer.borderColor = UIColor.brown.cgColor
        empImage.layer.cornerRadius = empImage.frame.height/2
        empImage.clipsToBounds = true
        empImage.image = employee.image
        empLabel.text = employee.name
    }

    

}
