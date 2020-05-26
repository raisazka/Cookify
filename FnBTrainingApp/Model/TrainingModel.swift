//
//  Training.swift
//  FnBTrainingApp
//
//  Created by Rais on 20/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

class TrainingModel {
    var name: String
    var image: UIImage
    var minute: Int
    
    init(name: String, image: UIImage, minute: Int) {
        self.name = name
        self.image = image
        self.minute = minute
    }
}
