//
//  HomeAdminModel.swift
//  FnBTrainingApp
//
//  Created by Nathanael Adolf Sukiman on 19/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

class homeAdminModel {
    
    var imageModel: String!
    var recipe: String!
    var imagePeople = [String]()
    
    init(recipe: String, imageModel: String, peoples:[String]) {
        self.recipe = recipe
        self.imageModel = imageModel
        self.imagePeople = peoples
    }
    
}
