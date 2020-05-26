//
//  EmployeePreparationVC.swift
//  FnBTrainingApp
//
//  Created by Daniel Claude Nabasa on 20/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class EmployeePreparationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prepTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prepareCell", for: indexPath)
        cell.textLabel!.text = prepTitleArray[indexPath.row]
        cell.detailTextLabel?.text = subPrepSubTitArray[indexPath.row]
        return cell
    }
    
    
    @IBOutlet weak var prepareTableView: UITableView!
    

    let prepTitleArray = ["Telur Ayam", "Margarin", "Susu", "Keju", "Garam","Lada","Wajan","Sendok Masak"]
    
    let subPrepSubTitArray = ["2 Butir","2 Sendok Teh","2 Sendok Makan","2 Sendok Makan","2 Sendok Teh","1 Sendok Teh","Ukuran Sedang","Ukuran Sedang"]
    
    let procedureArray = ["Pecahkan telur dan masukan kedalam mangkok.", "Kocok telur sampai tercampur lalu masukan garam dan merica lalu aduk lagi.","Masukan keju dan susu kemudian aduk lagi hingga tercampur.", "Masukan margarin kedalam wajan dan panaskan wajan hingga margarin meleleh.", "Gunakan api kecil setelah margarin meleleh lalu masukan telur kedalam wajan.", "Biarkan telur di dalam wajan selama 30 detik tanpa menyentuh telur sama sekali.", "Gunakan api sedang kemudian mulai aduk telur tersebut secara merata selama 20 detik", "Matikan api dan tetap aduk telur selama 7 detik kemudian sajikan ke dalam piring"]
    
    
    @IBOutlet weak var prepBerikutnyaButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        prepBerikutnyaButton.layer.cornerRadius = 10.0
        
        prepareTableView.dataSource = self
        prepareTableView.delegate = self

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
