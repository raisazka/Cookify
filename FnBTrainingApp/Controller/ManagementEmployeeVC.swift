//
//  ManagementEmployeeVC.swift
//  FnBTrainingApp
//
//  Created by Rais on 16/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ManagementEmployeeVC: UIViewController, UITableViewDelegate,
UITableViewDataSource,EmpTableDelegate {
    
    
    var employees : [Employee] = [
        Employee(name: "Henrdi",image: #imageLiteral(resourceName: "logo") , role: "Cook", training: [Training(name:"Kebab", image: #imageLiteral(resourceName: "kebab"), minute: 4), Training(name: "Pancake", image: #imageLiteral(resourceName: "pancake"), minute: 10),Training(name: "Steak", image: #imageLiteral(resourceName: "steak"), minute: 22)]),
        
        Employee(name: "Edward", image: #imageLiteral(resourceName: "logo"), role: "Cook", training: [Training(name: "Pancake", image: #imageLiteral(resourceName: "pancake"), minute: 10),Training(name: "Steak", image: #imageLiteral(resourceName: "steak"), minute: 22)]),
        
        Employee(name: "Rei", image: #imageLiteral(resourceName: "logo"), role: "Cashier", training: [Training(name:"Kebab", image: #imageLiteral(resourceName: "kebab"), minute: 4), Training(name: "Pancake", image: #imageLiteral(resourceName: "pancake"), minute: 10),Training(name: "Steak", image: #imageLiteral(resourceName: "steak"), minute: 22), Training(name:"Scrambled Egg", image: #imageLiteral(resourceName: "kebab"), minute: 15)])
    ]
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var filteredEmp = [Employee]()
    var arr = [[Employee]]()
    var roles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        filteredEmp = employees
        roles = countDifferent()
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
        if(roles.count == 0) {
            return categoryEmp
        }
        for i in 0...roles.count-1 {
            var empArr = [Employee]()
            for j in 0...filteredEmp.count-1 {
                if filteredEmp[j].role == roles[i] {
                    empArr.append(filteredEmp[j])
                }
            }
            categoryEmp.append(empArr)
        }
        return categoryEmp
    }
    
    private func countDifferent() -> [String] {
        var diffRoles = [String]()
        if(filteredEmp.count == 0) {
            return diffRoles
        }
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
    
    func viewAllEmployee(data: [Employee]) {
        performSegue(withIdentifier: "toEmployeeTable", sender: data)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countDifferent().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "empTableCell") as! EmployeeTableCell
        cell.sectionLabel.text = roles[indexPath.row]
        cell.empArray = arr[indexPath.row]
        cell.empCollectionView.reloadData()
        cell.delegate = self
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileSegue" {
            if let dest = segue.destination as? EmployeeProfileVC {
                dest.employee = sender as? Employee
            }
        }
        if segue.identifier == "toEmployeeTable" {
            if let dest = segue.destination as? EmployeeTableVC {
                dest.theEmployees = (sender as? [Employee])!
            }
        }
    }
    
    
       
}

extension ManagementEmployeeVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredEmp.removeAll()
        filteredEmp = searchText.isEmpty ? employees : employees.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
        roles = countDifferent()
        arr = filterEmployee()
        tableView.reloadData()
    }
    
}

