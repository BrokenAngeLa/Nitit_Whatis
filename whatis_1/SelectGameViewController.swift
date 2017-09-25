//
//  SelectGameViewController.swift
//  whatis_1
//
//  Created by student on 10/25/16.
//  Copyright © 2016 Nitit Rungrojaree. All rights reserved.
//

import UIKit

class SelectGameViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let select = SelectGame.list
    let selectImage = SelectGame.selectImage
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return select.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "selectGameCell") as! SelectGameViewCell
        cell.label.text = select[indexPath.row]
        cell.selectImage.image = UIImage(named: selectImage[indexPath.row])
      return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detail = segue.destination as! ViewController
            detail.mode = indexPath.row
        }
    }
}
