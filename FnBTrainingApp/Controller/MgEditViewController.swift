//
//  MgEditViewController.swift
//  FnBTrainingApp
//
//  Created by Nathanael Adolf Sukiman on 19/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class MgEditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var persiapanTabel: UITableView!
    
    var title1 = "Persiapan"
    /*var dataType1 = [
        persiapanModel(bahanModel: "Telur Ayam", jumlahModel: "3 butir"),
        persiapanModel(bahanModel: "Margarin", jumlahModel: "2 sendok teh"),
        //persiapanModel(bahanModel: "Susu", jumlahModel: "2 sendok makan") ]*/
    
    var bahan = ["Telur Ayam","Margarin","Susu"]
    var jumlah = ["3 butir","2 sendok teh","2 sendok makan"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        bahan.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = persiapanTabel.dequeueReusableCell(withIdentifier: "persiapanCell", for: indexPath) as! PersiapanTableViewCell
        
        cell.bahanLabel.text = bahan[indexPath.row]
        cell.jumlahLabel.text = jumlah[indexPath.row]
        cell.nextImage.image = #imageLiteral(resourceName: "back logo")
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           
        let headerView = UIView()
        
             headerView.backgroundColor = UIColor.white

             let sectionLabel = UILabel(frame: CGRect(x: 8, y: 28, width:
             tableView.bounds.size.width, height: tableView.bounds.size.height))
             sectionLabel.font = UIFont(name: "Helvetica", size: 20)
             sectionLabel.font = UIFont.boldSystemFont(ofSize: 20)
            sectionLabel.textColor = UIColor.gray
           sectionLabel.text = "Persiapan"
             sectionLabel.sizeToFit()
             headerView.addSubview(sectionLabel)
        
        return headerView
       }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBOutlet weak var titleEditLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        persiapanTabel.dataSource = self
        persiapanTabel.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
