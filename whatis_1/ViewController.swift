//
//  ViewController.swift
//  whatis
//
//  Created by Nitit Rungrojaree on 10/11/2559 BE.
//  Copyright © 2559 Nitit Rungrojaree. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var questionNo: UILabel!
    @IBOutlet weak var scoreBoard: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var checkAnswer: UIImageView!
    let defaults = UserDefaults.standard
    var mode = 0
    var play: PlayGame!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        play = PlayGame(mode: mode)
        startGame()
    }
    
    func startGame() {
        if !play.end() {
            end()
        }
        let result = play.playGame(questionNo: questionNo, scoreBoard: scoreBoard, showImage: showImage, btn1: btn1, btn2: btn2, btn3: btn3, btn4: btn4, checkAnswer: checkAnswer)
        questionNo = result.questionNo
        scoreBoard = result.scoreBoard
        showImage = result.showImage
        btn1 = result.btn1
        btn2 = result.btn2
        btn3 = result.btn3
        btn4 = result.btn4
        checkAnswer = result.checkAnswer
    }
    
    func end() {
        var lastLogin = Date.getDate()
        lastLogin = "\(lastLogin) Time: \(Date.getTime())"
        defaults.set(lastLogin, forKey: "lastPlay")
        let vc = storyboard?.instantiateViewController(withIdentifier: "scoreBoard") as! ScoreBoardViewController
        let alert = UIAlertController(title: "Insert Name", message: "Enter a text", preferredStyle: .alert)
        alert.addTextField { (textField) -> Void in
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            let textField = alert.textFields![0]
            DataBaseManager.addScore(score: self.play.score,total: self.play.count, name: textField.text!, date: Date.getDate(), mode: SelectGame.list[self.mode], time: self.play.startEndTime)
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnClick(sender: AnyObject) {
        play.checkAnswer(btn: sender)
        startGame()
    }
}

