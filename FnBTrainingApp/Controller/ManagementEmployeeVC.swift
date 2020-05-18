//
//  ManagementEmployeeVC.swift
//  FnBTrainingApp
//
//  Created by Rais on 16/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ManagementEmployeeVC: UIViewController {
    
    let employees : [Employee] = [Employee(name: "Henrdi",image: #imageLiteral(resourceName: "logo") , role: "Cook"), Employee(name: "Edward", image: #imageLiteral(resourceName: "logo"), role: "Cook"),Employee(name: "Rei", image: #imageLiteral(resourceName: "logo"), role: "Cashier")]
    
    let roles = ["Cook", "Cashier", "Cs"]
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        searchBar.backgroundImage = UIImage()
    }
       

    
}
