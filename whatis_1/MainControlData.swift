//
//  MainControlData.swift
//  whatis_1
//
//  Created by Nitit Rungrojaree on 11/10/2559 BE.
//  Copyright © 2559 Nitit Rungrojaree. All rights reserved.
//

import Foundation
import UIKit
class MainControlData {
    var lastLogin: String = ""
    var name: String = ""
    let defaults = UserDefaults.standard
    
    init() {
        if defaults.string(forKey: "lastPlay") != nil {
            lastLogin = defaults.string(forKey: "lastPlay")!
        }
        if defaults.string(forKey: "name") != nil {
            name = defaults.string(forKey: "name")!
        }
        firstTime()
    }
    
    func message(line1: UILabel,line2: UILabel) -> (line1: UILabel, line2: UILabel) {
        if defaults.string(forKey: "name") != nil {
            line1.text = "Welcome Back !!! \(name)"
        }
        else {
            line1.text = "---Welcome---"
        }
        if defaults.string(forKey: "lastPlay") != nil {
            line2.isHidden = false
            line2.text = "Last Play: \(lastLogin)"
        }
        else {
            line2.isHidden = true
        }
        return (line1,line2)
    }

    func firstTime() {
        if defaults.string(forKey: "firsttime") == nil {
            DataBaseQuestion.addQuestionTest()
        }
        defaults.set("", forKey: "firsttime")
    }
}
