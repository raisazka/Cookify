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
    
    
    let menuBelum = ["Telur Orak Arik","Roti Bakar","Ayam Goreng","Roti Bakar Telur","Nasi Goreng"]
       
    let gambarBelum = ["image.png","rotibakarr.png","Ayamgoreng.png","roti bakar telur.png","nasgor.png"]
       
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return menuBelum.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "belumCell", for: indexPath) as! BelumLatihanCollectionViewCell
        cell.belumLabel.text = menuBelum[indexPath.row]
        cell.belumImage.image = UIImage(named: gambarBelum[indexPath.row])
        return cell
    }

    
    @IBOutlet weak var gambarHome: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BelumColView.delegate = self
        BelumColView.dataSource = self
        
        APIManager.sharedInstance.getRecipeWithId(recipeId: 1, onSuccess: { json in
        DispatchQueue.main.async {
        print("dapet")
        }
        }, onFailure: { error in
           let alert = UIAlertController(title: "Error", message:error.localizedDescription, preferredStyle: .alert)
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
