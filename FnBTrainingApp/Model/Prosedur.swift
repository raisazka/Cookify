//
//  Prosedur.swift
//  FnBTrainingApp
//
//  Created by Theofani on 26/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

class Prosedur: NSObject {
    var gambar: UIImage?
    var deskripsi: String
    
    init(gambar: UIImage, deskripsi: String){
        self.gambar = gambar
        self.deskripsi = deskripsi
    }
    
}
