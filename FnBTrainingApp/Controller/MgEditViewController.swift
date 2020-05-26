//
//  MgEditViewController.swift
//  FnBTrainingApp
//
//  Created by Nathanael Adolf Sukiman on 19/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class MgEditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EditLatihanDelegate {
    
    
    @IBOutlet weak var persiapanTabel: UITableView!
    @IBOutlet weak var prosedurTabel: UITableView!
    
    var upcomingTasks: [Persiapan] = []
    var dataReceived: [Persiapan] = []
    
    var alert: UIAlertController!

    var choosenIndex: Int = -1
    
    var title2 = "Prosedur"
    var title1 = "Persiapan"
    
    var navigationBarTitle: String = ""
    
    var tempBahanModel: String = ""
    var tempJumlahModel: String = ""
    
    let editLauncher = EditLatihanLauncher()
    
    var dataType1 = [
                        Persiapan(bahanModel: "Telur Ayam", jumlahModel: "3 butir"),
                        Persiapan(bahanModel: "Margarin", jumlahModel: "2 sendok teh"),
                        Persiapan(bahanModel: "Susu", jumlahModel: "2 sendok makan"),
                        Persiapan(bahanModel: "Keju", jumlahModel: "2 sendok makan"),
                        Persiapan(bahanModel: "Garam", jumlahModel: "2 sendok teh"),
                        Persiapan(bahanModel: "Lada", jumlahModel: "1 sendok teh"),
                        Persiapan(bahanModel: "Wajan", jumlahModel: "ukuran sedang"),
                        Persiapan(bahanModel: "Sendok masak", jumlahModel: "ukuran sedang")
                    ]
    
    //Sesuain sama model barunya
    var dataType2 =
    [
        Prosedur(gambar: #imageLiteral(resourceName: "prosedur 1"), deskripsi: "Pecahkan Telur dan masukkan ke dalam mangkok"),
        Prosedur(gambar: #imageLiteral(resourceName: "prosedur 2"), deskripsi: "Kocok telur sampai tercampur lalu masukan garam dan merica lalu aduk lagi."),
        Prosedur(gambar: #imageLiteral(resourceName: "prosedur 3"), deskripsi: "Masukan keju dan susu kemudian aduk lagi hingga tercampur."),
        Prosedur(gambar: #imageLiteral(resourceName: "prosedur 4"), deskripsi: "Masukan margarin kedalam wajan dan panaskan wajan hingga margarin meleleh."),
        Prosedur(gambar: #imageLiteral(resourceName: "prosedur 5"), deskripsi: "Gunakan api kecil setelah margarin meleleh lalu masukan telur kedalam wajan."),
        Prosedur(gambar: #imageLiteral(resourceName: "prosedur 6"), deskripsi: "Biarkan telur di dalam wajan selama 30 detik tanpa menyentuh telur sama sekali."),
        Prosedur(gambar: #imageLiteral(resourceName: "prosedur 7"), deskripsi: "Gunakan api sedang kemudian mulai aduk telur tersebut secara merata selama 20 detik"),
        Prosedur(gambar: #imageLiteral(resourceName: "prosedur 8"), deskripsi: "Matikan api dan tetap aduk telur selama 7 detik kemudian sajikan ke dalam piring")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == persiapanTabel
        {
            return dataType1.count
        }
        else
        {
            return dataType2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == persiapanTabel
        {
            let cell = persiapanTabel.dequeueReusableCell(withIdentifier: "persiapanCell", for: indexPath) as! PersiapanTableViewCell
            
            cell.bahanLabel.text = dataType1[indexPath.row].bahan
            cell.jumlahLabel.text = dataType1[indexPath.row].jumlah
            
            return cell
        }
        else
        {
            let cell = prosedurTabel.dequeueReusableCell(withIdentifier: "prosedurCell", for: indexPath) as! ProsedurTableViewCell
            
            cell.prosedurImage.image = dataType2[indexPath.row].gambar
            
            cell.prosedurLabel.text = dataType2[indexPath.row].deskripsi
            
            return cell
        }
        
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let persiapanEdit = dataType1[indexPath.row]
        choosenIndex = indexPath.row
        handelModal(persiapan: persiapanEdit)
    }
    
    //Delegate Function
    func editLatihan() {
        if editLauncher.persiapanField.text!.isEmpty || editLauncher.keteranganField.text!.isEmpty {
           showAlert()
        } else {
            view.endEditing(true)
            dataType1[choosenIndex].bahan = editLauncher.persiapanField.text ?? ""
            dataType1[choosenIndex].jumlah = editLauncher.keteranganField.text ?? ""
            editLauncher.handleDismiss()
            editLauncher.keteranganField.resignFirstResponder()
            persiapanTabel.reloadData()
        }
    }
    
    
    let blackView = UIView()

    private func handelModal(persiapan: Persiapan) {
        editLauncher.handelModal(persiapan: persiapan)
    }
    
    @objc func handleDismiss() {
        editLauncher.handleDismiss()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let persiapanEditVC = segue.destination as? MgEditTable{
            persiapanEditVC.saveChoosenIndex = choosenIndex
            persiapanEditVC.initProduct(category: sender as! Persiapan)
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
    
    @IBAction func unwindToTable(sender: UIStoryboardSegue) {
        if sender.source is MgEditTable {
            dataType1[choosenIndex].bahan = tempBahanModel
            dataType1[choosenIndex].jumlah = tempJumlahModel
            
            persiapanTabel.reloadData()
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
        self.title = "\(navigationBarTitle)"
    
        persiapanTabel.dataSource = self
        persiapanTabel.delegate = self
        
        prosedurTabel.dataSource = self
        prosedurTabel.delegate = self
        
        editLauncher.editDelegate = self
    }
    
    func showAlert() {
       alert = UIAlertController(title: "Error", message: "Please complete the form", preferredStyle: .alert)
       let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
       alert.addAction(action)
       self.present(alert, animated: true, completion: nil)
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
