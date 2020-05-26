//
//  PersiapanEditVC.swift
//  FnBTrainingApp
//
//  Created by Theofani on 26/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class PersiapanEditVC: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var namaPelatihanTextField: UITextField!
    @IBOutlet var persiapanTableView: UITableView!
    
    var myModel = [Preparation]()
    
    var tambahBahan = ""
    var tambahKeterangan = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewUI()
//        setupModel()
    }
    
    func setupTableViewUI() {
        persiapanTableView.register(UINib(nibName: "PreparationEditTableViewCell", bundle: nil), forCellReuseIdentifier: "preparationCell")
        persiapanTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
//    func setupModel(){
//        myModel.append(Preparation(name: "Telor ayam", amount: "2 butir"))
//        myModel.append(Preparation(name: "Minyak goreng", amount: "3 sendok makan"))
//        myModel.append(Preparation(name: "Gula pasir", amount: "100 gram"))
//    }
    
    func insertNewCell(){
        
        myModel.append(Preparation(name: tambahBahan, amount: tambahKeterangan))
        
        let indexPath = IndexPath(row: myModel.count - 1, section: 0)
        
        persiapanTableView.beginUpdates()
        persiapanTableView.insertRows(at: [indexPath], with: .automatic)
        persiapanTableView.endUpdates()
        view.endEditing(true)
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue){
        insertNewCell()
    }
}

extension PersiapanEditVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myModel.count
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            let alert = UIAlertController(title: "Warning!", message: "Hapus data ini?", preferredStyle: .alert)
            let delete = UIAlertAction(title: "Ya", style: .destructive, handler: { action in
                self.myModel.remove(at: indexPath.row)
                tableView.reloadData()
                
            })
            let cancel = UIAlertAction(title: "Tidak", style: .cancel, handler: { action in
                tableView.reloadRows(at: [indexPath], with: .automatic)
            })
            alert.addAction(delete)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
           
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "preparationCell", for: indexPath) as? PreparationEditTableViewCell)!
        cell.myModel = myModel[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Message", message: "Clicked at index\(indexPath.row)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}


