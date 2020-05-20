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
    @IBOutlet weak var prosedurTabel: UITableView!
    
    var title2 = "Prosedur"
    var title1 = "Persiapan"
    
    /*var dataType1 = [
        persiapanModel(bahanModel: "Telur Ayam", jumlahModel: "3 butir"),
        persiapanModel(bahanModel: "Margarin", jumlahModel: "2 sendok teh"),
        //persiapanModel(bahanModel: "Susu", jumlahModel: "2 sendok makan") ] g tau kenapa masih belum bisa melakai cara ini*/
    
    var bahan = ["Telur Ayam","Margarin","Susu","Keju","Garam","Lada","Wajan","Sendok masak"]
    var jumlah = ["3 butir","2 sendok teh","2 sendok makan","2 sendok makan","2 sendok teh","1 sendok teh","ukuran sedang","ukuran sedang"]
    
    var prosedurImageArray = ["prosedur 1.png","prosedur 2.png","prosedur 3.png","prosedur 4.png","prosedur 5.png","prosedur 6.png","prosedur 7.png","prosedur 8.png"]
    
    var prosedurLabelArray = ["Pecahkan Telur dan masukkan ke dalam mangkok","Kocok telur sampai tercampur lalu masukan garam dan merica lalu aduk lagi.","Masukan keju dan susu kemudian aduk lagi hingga tercampur.","Masukan margarin kedalam wajan dan panaskan wajan hingga margarin meleleh.","Gunakan api kecil setelah margarin meleleh lalu masukan telur kedalam wajan.","Biarkan telur di dalam wajan selama 30 detik tanpa menyentuh telur sama sekali.","Gunakan api sedang kemudian mulai aduk telur tersebut secara merata selama 20 detik","Matikan api dan tetap aduk telur selama 7 detik kemudian sajikan ke dalam piring"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == persiapanTabel
        {
            return bahan.count
        }
        else
        {
            return prosedurImageArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == persiapanTabel
        {
            let cell = persiapanTabel.dequeueReusableCell(withIdentifier: "persiapanCell", for: indexPath) as! PersiapanTableViewCell
            
            cell.bahanLabel.text = bahan[indexPath.row]
            cell.jumlahLabel.text = jumlah[indexPath.row]
            
            return cell
        }
        else
        {
            let cell = prosedurTabel.dequeueReusableCell(withIdentifier: "prosedurCell", for: indexPath) as! ProsedurTableViewCell
            
            cell.prosedurImage.image = UIImage(named: prosedurImageArray[indexPath.row])
            
            cell.prosedurLabel.text = prosedurLabelArray[indexPath.row]
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == persiapanTabel
        {
            return 60
        }
        else
        {
           return 70
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if tableView == persiapanTabel
        {
            return title1
        }
        else
        {
            return title2
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           
        if tableView == persiapanTabel
        {
            let headerView = UIView()
            
            headerView.backgroundColor = UIColor.white

            let sectionLabel = UILabel(frame: CGRect(x: 20, y: 28, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
            sectionLabel.font = UIFont(name: "Helvetica", size: 20)
            sectionLabel.font = UIFont.boldSystemFont(ofSize: 17)
            sectionLabel.textColor = UIColor.gray
            sectionLabel.text = "Persiapan"
            sectionLabel.sizeToFit()
            headerView.addSubview(sectionLabel)
            
            return headerView
        }
        else{
            let headerView = UIView()
                       
           headerView.backgroundColor = UIColor.white

           let sectionLabel = UILabel(frame: CGRect(x: 20, y: 10, width:
           tableView.bounds.size.width, height: tableView.bounds.size.height))
           sectionLabel.font = UIFont(name: "Helvetica", size: 20)
           sectionLabel.font = UIFont.boldSystemFont(ofSize: 17)
           sectionLabel.textColor = UIColor.gray
           sectionLabel.text = "Prosedur"
           sectionLabel.sizeToFit()
           headerView.addSubview(sectionLabel)
           
           return headerView
        }
        
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
        
        prosedurTabel.dataSource = self
        prosedurTabel.delegate = self
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
