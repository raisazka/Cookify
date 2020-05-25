//
//  MgEditTable.swift
//  FnBTrainingApp
//
//  Created by Kevin Timotius on 22/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

class MgEditTable: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var namaPersiapanTF: UITextField!
    @IBOutlet weak var keteranganTF: UITextField!
    
    @IBOutlet weak var editButton: UIButton!
    
    var saveChoosenIndex: Int = 0
    
    var alert: UIAlertController!
    var namaPersiapan: String = ""
    var keterangan: String = ""
    var namaPersiapan1: String = ""
    var keterangan1: String = ""
    var products: [persiapanModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namaPersiapanTF.placeholder = namaPersiapan
        keteranganTF.placeholder = keterangan
        
        editButton.layer.cornerRadius = 10
    }
    
    func initProduct(category: persiapanModel){
        self.namaPersiapan = category.bahanModel
        self.keterangan = category.jumlahModel
    }
    
    @IBAction func editBtn(_ sender: Any) {
        if (namaPersiapanTF.text == "") || (keteranganTF.text == ""){
           showAlert()
        }else{
            namaPersiapan1 = namaPersiapanTF.text!
            keterangan1 = keteranganTF.text!
            self.products.append(persiapanModel(bahanModel: namaPersiapan1, jumlahModel: keterangan1))
            performSegue(withIdentifier: "unwindToTable" , sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let previousVC = segue.destination as? MgEditViewController
        {
            previousVC.choosenIndex = saveChoosenIndex
            previousVC.tempBahanModel = namaPersiapan1
            previousVC.tempJumlahModel = keterangan1
        }
    }
    
    func showAlert() {
        alert = UIAlertController(title: "Error", message: "Please complete the form", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
