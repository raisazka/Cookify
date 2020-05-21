//
//  TrainingCollectionView.swift
//  FnBTrainingApp
//
//  Created by Theofani on 21/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class TrainingCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {

        override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override var numberOfSections: Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "employeeCategoryCell", for: indexPath) as! TrainingCollectionViewCell
        return cell
    }

}
