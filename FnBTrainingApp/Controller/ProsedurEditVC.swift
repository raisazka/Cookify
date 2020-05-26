//
//  ProsedurEdtiVC.swift
//  FnBTrainingApp
//
//  Created by Theofani on 26/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ProsedurEditVC: UIViewController {

    @IBOutlet weak var tambahProsedur: UIButton!
    @IBOutlet weak var prosedurTableView: UITableView!
    
    private var myModel = [Prosedur]()
    
    var tambahGambarProsedur: UIImage?
    var tambahDeskripsi = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewUI()
    }
    
    func setupTableViewUI(){
        prosedurTableView.register(UINib(nibName: "ProsedurEditTableViewCell", bundle: nil), forCellReuseIdentifier: "prosedurCell")
        prosedurTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func insertNewCell(){
//        let defaultImage = #imageLiteral(resourceName: "logo")
        myModel.append(Prosedur(gambar: tambahGambarProsedur!, deskripsi: tambahDeskripsi))
        
        let indexPath = IndexPath(row: myModel.count - 1, section: 0)
        
        prosedurTableView.beginUpdates()
        prosedurTableView.insertRows(at: [indexPath], with: .automatic)
        prosedurTableView.endUpdates()
        view.endEditing(true)
    }

    @IBAction func unwindSegue(_ sender: UIStoryboardSegue){
        insertNewCell()
    }

}

extension ProsedurEditVC: UITableViewDataSource, UITableViewDelegate {
    
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
        let cell = (tableView.dequeueReusableCell(withIdentifier: "prosedurCell", for: indexPath) as? ProsedurEditTableViewCell)!
        cell.myProsedurModel = myModel[indexPath.row]
        return cell
    }
    
}
