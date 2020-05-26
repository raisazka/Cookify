//
//  AddIngredientsModalVC.swift
//  FnBTrainingApp
//
//  Created by Theofani on 26/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class AddIngredientsModalVC: UIViewController {

    @IBOutlet weak var tambahBahan: UITextField!
    @IBOutlet weak var tambahKeterangan: UITextField!
    @IBOutlet weak var tambahDataButton: UIButton!
    
    var namaBahan = ""
    var keterangan = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! PersiapanEditVC
        destVC.tambahBahan = tambahBahan.text!
        destVC.tambahKeterangan = tambahKeterangan.text!
    }
    
}
