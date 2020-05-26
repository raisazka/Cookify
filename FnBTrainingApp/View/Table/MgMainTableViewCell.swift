//
//  MgMainTableViewCell.swift
//  FnBTrainingApp
//
//  Created by Nathanael Adolf Sukiman on 18/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class MgMainTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!

    var array = [String]()
    override func awakeFromNib() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        // Initialization code
    }

    //override func setSelected(_ selected: Bool, animated: Bool) {
      //  super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    //}
    
    func loadCollectionView( array:[String]){
        self.array = array
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "personImageCell", for: indexPath) as! AssigneeCollectionViewCell
            print("MASUK")
            cell.personImage.image = UIImage(named: self.array[indexPath.row])
            return cell
    }

}
