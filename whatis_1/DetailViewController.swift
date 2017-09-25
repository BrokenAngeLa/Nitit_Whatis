//
//  DetailViewController.swift
//  whatis_1
//
//  Created by Nitit Rungrojaree on 11/11/2559 BE.
//  Copyright © 2559 Nitit Rungrojaree. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var mode: Int = 0
    var question: Results<GameQuestion>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question = DataBaseQuestion.getQuestion(num: mode)
        title = SelectGame.list[mode]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailViewCell
        cell.obImage.image = UIImage(named: question[indexPath.row].imageId)
        cell.obLabel.text = question[indexPath.row].arrayAnswerAndChoice[4]
        return cell
    }
}
