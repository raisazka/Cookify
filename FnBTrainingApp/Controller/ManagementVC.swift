//
//  ManagementVC.swift
//  FnBTrainingApp
//
//  Created by Rais on 13/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ManagementVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var cookTableView: UITableView!

    var chosenTitle: String = ""
    let titleCell :[String] = ["Cook"]
    var dataType = [homeAdminModel]()
 
    override func viewDidLoad() {
       
        cookTableView.dataSource = self
        cookTableView.delegate = self
        cookTableView.separatorStyle = .none
        cookTableView.separatorColor = .white
        
        self.dataType = [homeAdminModel(recipe: "Telor orak arik", imageModel: "TelorAssignee.png", peoples:["Telor Person 1.png","Telor Person 2.png","Telor Person 3.png","Telor Person 4.png"]),
                             homeAdminModel(recipe: "Wafflee", imageModel: "Waffle Assignee.png", peoples:["Telor Person 1.png","Telor Person 4.png"])
                             ]
    }
    
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
        cell.backImage.image = #imageLiteral(resourceName: "back logo")
        var images = dataType[indexPath.row].imagePeople
        print( dataType[indexPath.row])
        if(dataType[indexPath.row].imagePeople.count > 0){
            print("TEST", indexPath, dataType[indexPath.row].imagePeople )
            cell.loadCollectionView(array: images)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: (Bool)-> ()) in
            
            //perform segue
            self.chosenTitle = self.dataType[indexPath.row].recipe
            self.performSegue(withIdentifier: "toEditTrainingSegue", sender:nil)
            actionPerformed(true)
        }
        
        edit.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if let destination = segue.destination as? MgEditViewController
        {
            destination.navigationBarTitle = chosenTitle
        }
    }
}
