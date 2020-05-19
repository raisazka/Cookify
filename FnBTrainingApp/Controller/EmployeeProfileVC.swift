//
//  EmployeeProfileVC.swift
//  FnBTrainingApp
//
//  Created by Rais on 19/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class EmployeeProfileVC: UIViewController {
    
    var employee : Employee?
    
    @IBOutlet weak var empNameLabel: UILabel!
    @IBOutlet weak var empRoleLabel: UILabel!
    @IBOutlet weak var empImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        empImage.image = employee?.image
        empNameLabel.text = employee?.name
        empRoleLabel.text = employee?.role
        setupImage()
    }
    
    private func setupImage() {
        empImage.layer.borderWidth = 1
        empImage.layer.masksToBounds = false
        empImage.layer.borderColor = UIColor.brown.cgColor
        empImage.layer.cornerRadius = empImage.frame.height/2
        empImage.clipsToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
