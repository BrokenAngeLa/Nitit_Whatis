//
//  SettingViewController.swift
//  whatis_1
//
//  Created by Nitit Rungrojaree on 11/11/2559 BE.
//  Copyright © 2559 Nitit Rungrojaree. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var bTitleSlider: UISlider!
    @IBOutlet weak var rTitleSlider: UISlider!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var gTitleSlider: UISlider!
    @IBOutlet weak var rBGSlider: UISlider!
    @IBOutlet weak var gBGSlider: UISlider!
    @IBOutlet weak var bBGSlider: UISlider!
    
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLastSetting()
        // Do any additional setup after loading the view.
    }
    @IBAction func rTitleSlider(_ sender: Any) {
        changeColor()
    }
    @IBAction func gTitleSlider(_ sender: Any) {
        changeColor()
    }
    @IBAction func bTitleSlider(_ sender: Any) {
        changeColor()
    }
    @IBAction func rItemSlider(_ sender: Any) {
        changeColor()
    }
    @IBAction func gItemSlider(_ sender: Any) {
        changeColor()
    }
    @IBAction func bItemSlider(_ sender: Any) {
        changeColor()
    }
    
    func changeColor() {
        navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(rBGSlider.value), green: CGFloat(gBGSlider.value), blue: CGFloat(bBGSlider.value), alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor(red: CGFloat(rTitleSlider.value), green: CGFloat(gTitleSlider.value), blue: CGFloat(bTitleSlider.value), alpha: 1)
    }
  
    func loadLastSetting() {
        if !(defaults.string(forKey: "bgColour") == nil && defaults.string(forKey: "titleColour") == nil) {
            let bgColour = defaults.string(forKey: "bgColour")?.components(separatedBy: " ")
            let titleColour = defaults.string(forKey: "titleColour")?.components(separatedBy: " ")
            rTitleSlider.value = Float(titleColour![0])!
            gTitleSlider.value = Float(titleColour![1])!
            bTitleSlider.value = Float(titleColour![2])!
            rBGSlider.value = Float(bgColour![0])!
            gBGSlider.value = Float(bgColour![1])!
            bBGSlider.value = Float(bgColour![2])!
        }
        if defaults.string(forKey: "name") != nil {
            textName.text = defaults.string(forKey: "name")
        }
        
    }
    
    @IBAction func save(_ sender: Any) {
        defaults.set(textName.text,forKey: "name")
        let bgColour = "\(rBGSlider.value) \(gBGSlider.value) \(bBGSlider.value)"
        let titleColour = "\(rTitleSlider.value) \(gTitleSlider.value) \(bTitleSlider.value)"
        defaults.set(bgColour,forKey: "bgColour")
        defaults.set(titleColour,forKey: "titleColour")
        navigationController?.popToRootViewController(animated: true)
    }
}
