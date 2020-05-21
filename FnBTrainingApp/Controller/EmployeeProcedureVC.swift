//
//  EmployeeProcedureVC.swift
//  FnBTrainingApp
//
//  Created by Daniel Claude Nabasa on 19/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class EmployeeProcedureVC: UIViewController {
    
    var seconds = 30
    var timer = Timer()
    
    @IBOutlet weak var waktu: UILabel!
        
        
    
    @IBOutlet weak var tombolMulaiButton: UIButton!
    
    
    @IBAction func TombolMulai(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(EmployeeProcedureVC.counter), userInfo: nil, repeats: true)
    }
    
    @objc func counter(){
        seconds -= 1
        waktu.text = String(seconds) + " Detik"
        
        if (seconds == 0){
            timer.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tombolMulaiButton.layer.cornerRadius = 10.0

        // Do any additional setup after loading the view.
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
