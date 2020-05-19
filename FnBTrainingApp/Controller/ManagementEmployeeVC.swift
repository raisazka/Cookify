//
//  ManagementEmployeeVC.swift
//  FnBTrainingApp
//
//  Created by Rais on 16/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ManagementEmployeeVC: UIViewController, UITableViewDelegate,
                            UITableViewDataSource, EmpTableDelegate {
    
    
    var employees : [Employee] = [Employee(name: "Henrdi",image: #imageLiteral(resourceName: "logo") , role: "Cook"), Employee(name: "Edward", image: #imageLiteral(resourceName: "logo"), role: "Cook"),Employee(name: "Rei", image: #imageLiteral(resourceName: "logo"), role: "Cashier")]
            
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var filteredEmp = [Employee]()
    var arr = [[Employee]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        filteredEmp = employees
        arr = filterEmployee()
        setupTableView()
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    private func filterEmployee() -> [[Employee]] {
        var categoryEmp = [[Employee]]()
        for i in 0...countDifferent().count-1 {
            var empArr = [Employee]()
            for j in 0...filteredEmp.count-1 {
                if filteredEmp[j].role == countDifferent()[i] {
                    empArr.append(filteredEmp[j])
                }
            }
            categoryEmp.append(empArr)
        }
        return categoryEmp
    }
    
    private func countDifferent() -> [String] {
        var diffRoles = [String]()
        for i in 0...filteredEmp.count - 1 {
            if(!diffRoles.contains(filteredEmp[i].role)) {
                diffRoles.append(filteredEmp[i].role)
            }
        }
        return diffRoles
    }
    
    func cellPressed(data: Employee) {
        performSegue(withIdentifier: "profileSegue", sender: data)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countDifferent().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "empTableCell") as! EmployeeTableCell
        print(arr)
        cell.sectionLabel.text = countDifferent()[indexPath.row]
        cell.empArray = arr[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileSegue" {
            if let dest = segue.destination as? EmployeeProfileVC {
                dest.employee = sender as? Employee
            }
        }
    }
    
    
       
}

extension ManagementEmployeeVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredEmp = searchText.isEmpty ? employees : employees.filter { (emp : Employee) -> Bool in
            return emp.name.range(of: searchText,options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        setupTableView()
        tableView.reloadData()
    }
}
