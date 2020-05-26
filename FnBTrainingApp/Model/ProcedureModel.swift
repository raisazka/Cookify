//
//  LatihanEmployee.swift
//  FnBTrainingApp
//
//  Created by Daniel Claude Nabasa on 25/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ProcedureModel {
    var menuEmployee : String
    var gambarEmployee : UIImage?
    var id : Int?
    
    init(id:Int, menu: String, menuImage : UIImage) {
        self.menuEmployee = menu
        self.gambarEmployee = menuImage
        self.id = id
        
    }
}
