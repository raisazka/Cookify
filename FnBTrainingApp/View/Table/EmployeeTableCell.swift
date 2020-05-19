//
//  EmployeeCell.swift
//  FnBTrainingApp
//
//  Created by Rais on 17/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

protocol EmpTableDelegate {
    func cellPressed(data: Employee)
}

class EmployeeTableCell: UITableViewCell, UICollectionViewDelegate,
            UICollectionViewDataSource, EmpCellDelegate {
   
    @IBOutlet weak var sectionLabel: UILabel!
    
    @IBOutlet weak var empCollectionView: UICollectionView!
    
    var empArray = [Employee]()
    var delegate: EmpTableDelegate?
    
    override func awakeFromNib() {
        empCollectionView.delegate = self
        empCollectionView.dataSource = self
    }
    
    func theSegue(data: Employee) {
        delegate?.cellPressed(data: data)
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return empArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "empCollectionCell", for: indexPath) as! EmployeeCollectionCell
        let employee = empArray[indexPath.row]
        cell.configure(employee: employee)
        cell.employee = employee
        cell.empCellDelegate = self
        return cell
    }

}
