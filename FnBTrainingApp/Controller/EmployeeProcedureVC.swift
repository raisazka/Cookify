//
//  EmployeeProcedureVC.swift
//  FnBTrainingApp
//
//  Created by Daniel Claude Nabasa on 19/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class EmployeeProcedureVC: UIViewController {
    
    let procedureArr =
        [ProcedureModel(id:1, menu:"Pecahkan telur dan masukan kedalam mangkok.", menuImage:#imageLiteral(resourceName: "crack-eggs-into-bowl") ),
         ProcedureModel(id:2,menu:"Kocok telur sampai tercampur lalu masukan garam dan merica lalu aduk lagi.", menuImage: #imageLiteral(resourceName: "images-2")),
         ProcedureModel(id:3,menu: "Masukan keju dan susu kemudian aduk lagi hingga tercampur.", menuImage :#imageLiteral(resourceName: "custard-pudding-7")),
         ProcedureModel(id:4,menu: "Masukan margarin kedalam wajan dan panaskan wajan hingga margarin meleleh.", menuImage: #imageLiteral(resourceName: "10") ),
         ProcedureModel(id:12,menu: "Gunakan api kecil setelah margarin meleleh lalu masukan telur kedalam wajan.", menuImage : #imageLiteral(resourceName: "images")),
         ProcedureModel(id:99,menu: "Biarkan telur di dalam wajan selama 30 detik tanpa menyentuh telur sama sekali.", menuImage : #imageLiteral(resourceName: "640x960")),
         ProcedureModel(id:102,menu: "Gunakan api sedang kemudian mulai aduk telur tersebut secara merata selama 20 detik", menuImage: #imageLiteral(resourceName: "IMG_0162")),
         ProcedureModel(id:10,menu: "Matikan api dan tetap aduk telur selama 7 detik kemudian sajikan ke dalam piring", menuImage: #imageLiteral(resourceName: "20150511-scrambled-eggs-vicky-wasik-9")),
         ProcedureModel(id:88,menu: "Anda telah menyelesaikan training.", menuImage: #imageLiteral(resourceName: "image"))
        
        ]
    let procedureDescOrakArikArray = ["Pecahkan telur dan masukan kedalam mangkok.","Kocok telur sampai tercampur lalu masukan garam dan merica lalu aduk lagi.","Masukan keju dan susu kemudian aduk lagi hingga tercampur.", "Masukan margarin kedalam wajan dan panaskan wajan hingga margarin meleleh.", "Gunakan api kecil setelah margarin meleleh lalu masukan telur kedalam wajan.", "Biarkan telur di dalam wajan selama 30 detik tanpa menyentuh telur sama sekali.", "Gunakan api sedang kemudian mulai aduk telur tersebut secara merata selama 20 detik", "Matikan api dan tetap aduk telur selama 7 detik kemudian sajikan ke dalam piring", "Anda telah menyelesaikan training."]
    let procedureImgOrakArikArray = [#imageLiteral(resourceName: "crack-eggs-into-bowl"),#imageLiteral(resourceName: "images-2"),#imageLiteral(resourceName: "custard-pudding-7"),#imageLiteral(resourceName: "10"),#imageLiteral(resourceName: "images"),#imageLiteral(resourceName: "640x960"),#imageLiteral(resourceName: "IMG_0162"),#imageLiteral(resourceName: "20150511-scrambled-eggs-vicky-wasik-9"),#imageLiteral(resourceName: "image")]
    
    @IBOutlet weak var imageProcedure: UIImageView!
    
    
    
    @IBOutlet weak var labelProcedure: UILabel!
    
    
    
    
    
    
    var secondsA = 10
    var secondsB = 10
    var buttonState : Int = 1
    var pageState : Int = 0
    var timer = Timer()
    
    @IBOutlet weak var waktu: UILabel!
    
        
    
    @IBOutlet weak var tombolMulaiButton: UIButton!
    
    
    @IBAction func TombolMulai(_ sender: Any) {
        switch buttonState {
        case 1:
            SecondA()
            break
        case 2:
            let condition = procedureDescOrakArikArray.count - 2
            if pageState >= condition {
                buttonState = 3
                tombolMulaiButton.setTitle("Selesai", for: .normal)
                self.imageProcedure.image = procedureArr[pageState + 1].gambarEmployee
                self.labelProcedure.text = procedureArr[pageState + 1].menuEmployee
                print(buttonState)
                break
            }
                else{
                pageState += 1
                self.imageProcedure.image = procedureImgOrakArikArray[pageState]
                self.labelProcedure.text = procedureDescOrakArikArray[pageState]
                }
            
        case 3 :
            let condition2 = procedureDescOrakArikArray.count - 2
            print(buttonState, condition2, pageState)
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: EmployeeVC.self){
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
                
            }
//            let storyboard = UIStoryboard(name: "Employee", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "EmpSB")
//            self.navigationController?.popToViewController(ViewController : vc, animated: true)
                      
            
                break
            
            
        
                
            
        
            
                
        
            
            
        default:
            break
        }
        
    
    }
    
    @objc func counter(){
        secondsA -= 1
        waktu.text = String(secondsA) + " Detik"
        
        if (secondsA < 1){
            timer.invalidate()
            waktuHabis()
        }
        
        
    }
    func SecondA()  {
    
        self.buttonState = 2
         tombolMulaiButton.setTitle("Berikutnya", for: .normal)
        
    if secondsA > 0 {
               timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(EmployeeProcedureVC.counter), userInfo: nil, repeats: true)
               
           }
    }
    
  func waktuHabis() {
      let habis = UIAlertController(title: "Waktu Anda Habis", message: nil, preferredStyle: UIAlertController.Style.alert)
    habis.addAction(UIAlertAction(title: "Ulangi Latihan", style: .destructive, handler: {action in
        self.secondsA = self.secondsB
        self.waktu.text = String(self.secondsA) + " Detik"
        print(self.secondsA)
        print(self.secondsB)
        self.imageProcedure.image = self.procedureImgOrakArikArray[0]
        self.labelProcedure.text = self.procedureDescOrakArikArray[0]
        self.tombolMulaiButton.setTitle("Mulai", for: .normal)
        self.buttonState = 1
      }))
      
      present(habis, animated: true)
      
      
  }
    
//     cooktify
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tombolMulaiButton.layer.cornerRadius = 10.0
        imageProcedure.layer.cornerRadius = 10.0
        
       tombolMulaiButton.setTitle("Mulai", for: .normal)
        
        self.imageProcedure.image = procedureImgOrakArikArray[0]
        self.labelProcedure.text = procedureDescOrakArikArray[0]
        
        waktu.text = String(secondsA) + " Detik"
        

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
