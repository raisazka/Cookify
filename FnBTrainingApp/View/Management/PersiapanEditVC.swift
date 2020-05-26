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
    
    private var myModel = [Preparation]()
    private var dataCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewUI()
        setupModel()
    }
    
    func setupTableViewUI() {
        persiapanTableView.register(UINib(nibName: "PreparationEditTableViewCell", bundle: nil), forCellReuseIdentifier: "preparationCell")
    }
    
    func setupModel(){
        myModel.append(Preparation(name: "Telor ayam", amount: "2 butir"))
        myModel.append(Preparation(name: "Minyak goreng", amount: "3 sendok makan"))
        myModel.append(Preparation(name: "Gula pasir", amount: "100 gram"))
    }

}

extension PersiapanEditVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            myModel.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "preparationCell", for: indexPath) as? PreparationEditTableViewCell)!
        cell.myModel = myModel[indexPath.row]
        return cell
    }
    
}


