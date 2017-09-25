//
//  ScoreBoardViewController.swift
//  whatis_1
//
//  Created by student on 10/18/16.
//  Copyright © 2016 Nitit Rungrojaree. All rights reserved.
//

import UIKit
import RealmSwift
class ScoreBoardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var scoreBoard: Results<Score>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreBoard = DataBaseManager.getScore()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreBoard.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellScoreBoard = tableView.dequeueReusableCell(withIdentifier: "cellScoreBoard") as! ScoreBoardViewCell
        let rankImageData = DataBaseManager.rankImage
        
        cellScoreBoard.rankNameScore.text = "Rank: \(indexPath.row + 1) Name: \(scoreBoard[indexPath.row].name) Score: \(scoreBoard[indexPath.row].score)"
        cellScoreBoard.dateMode.text = "Date: \(scoreBoard[indexPath.row].date) Mode: \(scoreBoard[indexPath.row].mode)"
        cellScoreBoard.imageRank.image = indexPath.row < rankImageData.count ? UIImage(named: "\(rankImageData[indexPath.row])") : UIImage(named: "thankyou")
        return cellScoreBoard
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detail = segue.destination as! DetailScoreViewController
            detail.indexNo = indexPath.row
            detail.title = "Rank: \(indexPath.row + 1)"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataBaseManager.deleteScore(scoreBoard: scoreBoard[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func resetScoreBoard(_ sender: AnyObject) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "scoreBoard") as! ScoreBoardViewController
        
        let alert = UIAlertController(title: "ScoreBoard", message: "Reset ScoreBoard", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in
            
        }))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
           // DataBaseManager.deleteScore()
            
            let alert = UIAlertController(title: "ScoreBoard", message: "Reset Complete", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                DataBaseManager.resetScoreBoard()
                self.navigationController?.popToRootViewController(animated: true)
                
            }))
            self.present(alert, animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
