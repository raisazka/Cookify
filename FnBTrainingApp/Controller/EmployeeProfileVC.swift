//
//  EmployeeProfileVC.swift
//  FnBTrainingApp
//
//  Created by Rais on 19/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class EmployeeProfileVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var employee : Employee?
    
    @IBOutlet weak var empNameLabel: UILabel!
    @IBOutlet weak var empRoleLabel: UILabel!
    @IBOutlet weak var empImage: UIImageView!
    
    @IBOutlet weak var trainingCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        empImage.image = employee?.image
        empNameLabel.text = employee?.name
        empRoleLabel.text = employee?.role
        setupCollectionView()
        setupImage()
    }
    
    private func setupCollectionView() {
        trainingCollection.delegate = self
        trainingCollection.dataSource = self
    }
    
    private func setupImage() {
        empImage.layer.borderWidth = 1
        empImage.layer.masksToBounds = false
        empImage.layer.borderColor = UIColor.brown.cgColor
        empImage.layer.cornerRadius = empImage.frame.height/2
        empImage.clipsToBounds = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (employee?.trainings.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = trainingCollection.dequeueReusableCell(withReuseIdentifier: "empTrainingCell", for: indexPath) as! EmployeeTrainingCollectionCell
        let training = employee!.trainings[indexPath.row]
        cell.configure(training: training)
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
       self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }


}
