//
//  TrainingCategoryVC.swift
//  FnBTrainingApp
//
//  Created by Theofani on 23/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class TrainingCategoryVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var categoryCollectionView: UICollectionView!
    
    let trainingArray: [Training] = [
        Training(name: "Masak", image: #imageLiteral(resourceName: "masak")),
        Training(name: "Kasir", image: #imageLiteral(resourceName: "kasir")),
        Training(name: "Inventaris", image: #imageLiteral(resourceName: "inventaris")),
        Training(name: "Pelayan", image: #imageLiteral(resourceName: "pelayan"))
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trainingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "employeeCategoryCell", for: indexPath) as! TrainingCollectionViewCell
        let category = trainingArray[indexPath.item]
        cell.employeeCategoryImageView.image = category.image
        cell.employeeCategoryLabel.text = category.name
        
        return cell
    }
    
}


