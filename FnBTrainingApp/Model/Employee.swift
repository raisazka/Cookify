//
//  Employee.swift
//  FnBTrainingApp
//
//  Created by Rais on 16/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class Employee {
    
    var name: String
    var image: UIImage?
    var role: String
    var trainings : [TrainingModel] = []
    
    init(name: String, image: UIImage, role:String, training: [TrainingModel]) {
        self.name = name
        self.image = image
        self.role = role
        self.trainings.append(contentsOf: training)
    }
    
}
