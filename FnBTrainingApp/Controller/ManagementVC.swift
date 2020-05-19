//
//  ManagementVC.swift
//  FnBTrainingApp
//
//  Created by Rais on 13/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ManagementVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let titleCell = ["Telor orak-arik","Waffle"]
    let assigneeCell = ["TelorAssignee","Waffle Assignee"]
    
    @IBOutlet weak var cookTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return titleCell.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Cook"
        default:
            "Cook"
        }
        
        return "Cook"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.white

              let sectionLabel = UILabel(frame: CGRect(x: 8, y: 28, width:
                  tableView.bounds.size.width, height: tableView.bounds.size.height))
              sectionLabel.font = UIFont(name: "Helvetica", size: 20)
        sectionLabel.font = UIFont.boldSystemFont(ofSize: 20)
              sectionLabel.textColor = UIColor.black
              sectionLabel.text = "COOK"
        
              sectionLabel.sizeToFit()
              headerView.addSubview(sectionLabel)

              return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 145
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cookCell", for: indexPath) as! MgMainTableViewCell
        
        cell.titleCell.text = titleCell[indexPath.row]
        cell.assigneeImage.image = UIImage(named: assigneeCell[indexPath.row]+".png")
        
        cell.backImage.image = #imageLiteral(resourceName: "back logo")
        
        return cell
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
        
        
        cookTableView.separatorStyle = .none
        cookTableView.separatorColor = .white
        
        cookTableView.dataSource = self
        cookTableView.delegate = self
        
    }
    
}




