//
//  MgEditTable.swift
//  FnBTrainingApp
//
//  Created by Kevin Timotius on 22/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

class MgEditTable: UIViewController{
    
    @IBOutlet weak var namaPersiapanTF: UITextField!
    @IBOutlet weak var keteranganTF: UITextField!
    
    var namaPersiapan: String = ""
    var keterangan: String = ""
    var products = [persiapanModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initProduct(category: persiapanModel){
        self.namaPersiapan = category.bahanModel
        self.keterangan = category.jumlahModel
    }
    
}
