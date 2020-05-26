//
//  persiapanModel.swift
//  FnBTrainingApp
//
//  Created by Nathanael Adolf Sukiman on 19/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

class Persiapan {
    var bahan: String
    var jumlah: String
    
    init(bahanModel: String, jumlahModel: String) {
        self.bahan = bahanModel
        self.jumlah = jumlahModel
    }
}
