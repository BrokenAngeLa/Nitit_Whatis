//
//  DetailScoreViewController.swift
//  whatis_1
//
//  Created by Nitit Rungrojaree on 10/19/2559 BE.
//  Copyright © 2559 Nitit Rungrojaree. All rights reserved.
//

import UIKit
import RealmSwift
class DetailScoreViewController: UIViewController {
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var rankImage: UIImageView!
    @IBOutlet weak var scoreName: UILabel!
    @IBOutlet weak var dateMode: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var progressBar: KDCircularProgress!
    
    var scoreBoard: Results<Score>!
    var indexNo: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreBoard = DataBaseManager.getScore()
        initial()
        // Do any additional setup after loading the view.
    }
    
    func initial() {
        let rankImageData = DataBaseManager.rankImage
        date.text = "Date: \(Date.getDate())"
        dateMode.text = "Date: \(scoreBoard[indexNo].date) Mode: \(scoreBoard[indexNo].mode)"
        scoreName.text = "Name: \(scoreBoard[indexNo].name) Score: \(scoreBoard[indexNo].score)"
        let startEnd = scoreBoard[indexNo].time.components(separatedBy: " ")
        time.text = "Start: \(startEnd[0]) End: \(startEnd[1])"
        rankImage.image = indexNo < rankImageData.count ? UIImage(named: "\(rankImageData[indexNo])") : UIImage(named: "thankyou")
        scoreText.text = "\(scoreBoard[indexNo].score) / \(scoreBoard[indexNo].total)"
        progressBar.animate(toAngle: newAngle(), duration: 1, completion: nil)
    }
    
    func newAngle() -> Double {
        return 360 * scoreBoard[indexNo].realScore
    }

}
