//
//  MenuViewController.swift
//  whatis_1
//
//  Created by Nitit Rungrojaree on 10/18/2559 BE.
//  Copyright © 2559 Nitit Rungrojaree. All rights reserved.
//

import UIKit
import RealmSwift
class MenuViewController: UIViewController {
    
    @IBOutlet weak var line1: UILabel!
    @IBOutlet weak var line2: UILabel!
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        let main = MainControlData()
        let line = main.message(line1: line1, line2: line2)
        line1 = line.line1
        line2 = line.line2
        loadSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let main = MainControlData()
        let line = main.message(line1: line1, line2: line2)
        line1 = line.line1
        line2 = line.line2
    }

    func loadSetting() {
         if !(defaults.string(forKey: "bgColour") == nil && defaults.string(forKey: "titleColour") == nil) {
            let bgColour = defaults.string(forKey: "bgColour")?.components(separatedBy: " ")
            let titleColour = defaults.string(forKey: "titleColour")?.components(separatedBy: " ")
            navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(Double(bgColour![0])!), green: CGFloat(Double((bgColour?[1])!)!), blue: CGFloat(Double((bgColour?[2])!)!), alpha: 1)
            navigationController?.navigationBar.tintColor = UIColor(red: CGFloat(Double(titleColour![0])!), green: CGFloat(Double((titleColour?[1])!)!), blue: CGFloat(Double((titleColour?[2])!)!), alpha: 1)
        }
    }    
}
