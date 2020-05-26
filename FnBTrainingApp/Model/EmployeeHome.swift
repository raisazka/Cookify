//
//  LatihanEmployeeHome.swift
//  FnBTrainingApp
//
//  Created by Daniel Claude Nabasa on 26/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class EmployeeHome {
    var menuHome : String
    var gambarMenu : UIImage?
    var id : Int

    init(id:Int, namaMenu: String, gambarMenuHome: UIImage){
        self.menuHome = namaMenu
        self.gambarMenu = gambarMenuHome
        self.id = id
}
}
