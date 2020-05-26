//
//  ViewController.swift
//  FnBTrainingApp
//
//  Created by Rais on 13/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let role = "employee"
    
    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTextField(imageName: "envelope.fill", textField: fieldEmail)
        initTextField(imageName: "lock.fill", textField: fieldPassword)
        loginBtn.layer.cornerRadius = 10
    }
    
    private func initTextField(imageName: String, textField: UITextField) {
        let imageView = UIImageView(frame:
        CGRect(x: 0, y: 5, width: 28, height: 20))
        let iconView: UIView = UIView(frame:
        CGRect(x: 15, y: 0, width: 40, height: 30))
        
        let image = UIImage(systemName: imageName)
        imageView.image = image
        iconView.addSubview(imageView)
        textField.leftView = iconView
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 2.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        textField.textColor = UIColor.white
    }
    
    @IBAction func login(_ sender: Any) {
        if role == "admin" {
            presentStoryboard(sbName: "Management")
        } else {
            presentStoryboard(sbName: "Employee")
        }
    }
    
    private func presentStoryboard(sbName : String) {
         let storyboard = UIStoryboard(name: sbName, bundle: nil)
          let vc = storyboard.instantiateInitialViewController()!
          vc.modalPresentationStyle = .fullScreen
          show(vc, sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }


}

