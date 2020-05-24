//
//  EmployeeTableVC.swift
//  FnBTrainingApp
//
//  Created by Rais on 22/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class EmployeeTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var theEmployees = [Employee]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theEmployees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "empTblCell", for: indexPath) as! EmployeeDetailTableCell
        let employee = theEmployees[indexPath.row]
        cell.empImage.image = employee.image
        cell.empName.text = employee.name
        cell.empRole.text = employee.role
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toProfileFromTable", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProfileFromTable" {
            if let dest = segue.destination as? EmployeeProfileVC {
                let index = sender as! NSIndexPath
                dest.employee = theEmployees[index.row]
            }
        }
    }
    

}
