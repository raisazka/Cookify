//
//  ViewController.swift
//  FnBTrainingApp
//
//  Created by Rais on 13/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let role = "admin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func login(_ sender: Any) {
        if role == "admin" {
            presentStoryboard(sbName: "Management", vcIdentifier: "ManagementSB")
        } else {
            presentStoryboard(sbName: "Employee", vcIdentifier: "EmpSB")
        }
    }
    
    func presentStoryboard(sbName : String, vcIdentifier : String) {
         let storyboard = UIStoryboard(name: sbName, bundle: nil)
          let vc = storyboard.instantiateViewController(withIdentifier: vcIdentifier)
          self.show(vc, sender: self)
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

