//
//  ManagementVC.swift
//  FnBTrainingApp
//
//  Created by Rais on 13/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ManagementVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let titleCell = ["Cook"]
    
    var dataType = [homeAdminModel(recipe: "Telor orak arik", imageModel: "TelorAssignee.png"),
                    homeAdminModel(recipe: "Wafflee", imageModel: "Waffle Assignee.png")
                    ]
    

      
    @IBOutlet weak var cookTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataType.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return titleCell.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return titleCell[section]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
          let headerView = UIView()
          headerView.backgroundColor = UIColor.white

          let sectionLabel = UILabel(frame: CGRect(x: 8, y: 28, width:
          tableView.bounds.size.width, height: tableView.bounds.size.height))
          sectionLabel.font = UIFont(name: "Helvetica", size: 20)
          sectionLabel.font = UIFont.boldSystemFont(ofSize: 20)
          sectionLabel.textColor = UIColor.black
        sectionLabel.text = "Cook"
          sectionLabel.sizeToFit()
          headerView.addSubview(sectionLabel)

          return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 145
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cookCell", for: indexPath) as! MgMainTableViewCell
        
        cell.titleCell.text = dataType[indexPath.row].recipe
        cell.assigneeImage.image = UIImage(named: dataType[indexPath.row].imageModel)
        
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




