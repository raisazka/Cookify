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
    
    let categoryImage: [UIImage] = [#imageLiteral(resourceName: "masak"),#imageLiteral(resourceName: "kasir"),#imageLiteral(resourceName: "inventaris"),#imageLiteral(resourceName: "pelayan")]
    let categoryLabel = ["Masak", "Kasir", "Inventaris", "Pelayan"]
    
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
        return categoryLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "employeeCategoryCell", for: indexPath) as! TrainingCollectionViewCell
        
        cell.employeeCategoryImageView.image = categoryImage[indexPath.item]
        cell.employeeCategoryLabel.text = categoryLabel[indexPath.item]
        
        return cell
    }
    
}


