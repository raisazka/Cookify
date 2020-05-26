//
//  EmployeeVC.swift
//  FnBTrainingApp
//
//  Created by Daniel Claude Nabasa on 19/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class EmployeeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    

    @IBOutlet weak var BelumColView: UICollectionView!
    
    var homeArr = [EmployeeHome]()
    
    let menuBelum = ["Telur Orak Arik","Roti Bakar","Ayam Goreng","Roti Bakar Telur","Nasi Goreng"]
       
    let gambarBelum = ["image.png","rotibakarr.png","Ayamgoreng.png","roti bakar telur.png","nasgor.png"]
       
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeArr.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "belumCell", for: indexPath) as! BelumLatihanCollectionViewCell
        cell.belumLabel.text = homeArr[indexPath.row].menuHome
        cell.belumImage.image = homeArr[indexPath.row].gambarMenu
        return cell
    }

    
    @IBOutlet weak var gambarHome: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BelumColView.delegate = self
        BelumColView.dataSource = self
        
        APIManager.sharedInstance.getRecipe( onSuccess: { json in
        DispatchQueue.main.async {
            for i in 0 ..< json.count {
                let newData = json[i]
                let url = URL(string: newData["recipe_image"].string ?? "https://www.tiket.com/promo/wishes-from-heart")
                if let data = try? Data(contentsOf: url!) {
                    let image = UIImage(data: data)
                    let defaultImage = #imageLiteral(resourceName: "nasgor")
                    self.homeArr.append(EmployeeHome(id: newData["id"].int! , namaMenu: newData["recipe_name"].string!, gambarMenuHome: image ?? defaultImage))
                    }
//                self.homeArr.append(EmployeeHome(id: newData["id"].int! , namaMenu: newData["recipe_name"].string!, gambarMenuHome: UIImage(data: newData["recipe_image"].string!) ?? #imageLiteral(resourceName: "image"))
            }
        print("dapet")
            self.BelumColView.reloadData()
        }
        }, onFailure: { error in
            print(error.localizedDescription)
        })
        
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
