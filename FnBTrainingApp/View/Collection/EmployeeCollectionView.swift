//
//  EmployeeCollectionView.swift
//  FnBTrainingApp
//
//  Created by Rais on 17/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class EmployeeCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override var numberOfSections: Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "empCollectionCell", for: indexPath) as! EmployeeCollectionCell
        return cell
    }

}
