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
        
        print(saveChoosenIndex)
    }
    
    func initProduct(category: persiapanModel){
        self.namaPersiapan = category.bahanModel
        self.keterangan = category.jumlahModel
    }
    
    @IBAction func editBtn(_ sender: Any) {
        if (namaPersiapanTF.text == "") || (keteranganTF.text == ""){
           showAlert()
        }else{
            namaPersiapanTF.text = namaPersiapan1
            keteranganTF.text = keterangan1
            self.products.append(persiapanModel(bahanModel: namaPersiapan1, jumlahModel: keterangan1))
            performSegue(withIdentifier: "unwindToTable" , sender: self)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let previousVC = segue.destination as? MgEditViewController
        {
            previousVC.dataReceived.append(contentsOf: products)
        }
    }
    
    
    func showAlert() {
        alert = UIAlertController(title: "Error", message: "Please complete the form", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
