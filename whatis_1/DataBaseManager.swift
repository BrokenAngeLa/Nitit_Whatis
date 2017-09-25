//
//  DataBaseManager.swift
//  whatis_1
//
//  Created by Nitit Rungrojaree on 11/10/2559 BE.
//  Copyright © 2559 Nitit Rungrojaree. All rights reserved.
//

import Foundation
import RealmSwift
class DataBaseManager {
    
    static let rankImage = ["rank1","rank2","rank3"] // can extend
    
    static func addScore(score: Int, total: Int, name: String, date: String, mode: String, time: String){
        let scoreBoard = Score()
        scoreBoard.score = score
        scoreBoard.total = total
        scoreBoard.name = name
        scoreBoard.date = date
        scoreBoard.mode = mode
        scoreBoard.realScore = Double(score) / Double(total)
        scoreBoard.time = time
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(scoreBoard)
        }
    }
    
    static func getScore() -> Results<Score> {
        let realm = try! Realm()
        return realm.objects(Score.self).sorted(byProperty: "realScore", ascending: false)
    }
    
    static func deleteScore(scoreBoard: Score) {
        let realm = try! Realm()
        try! realm.write {
           realm.delete(scoreBoard)
        }
    }
    
    static func resetScoreBoard() {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(getScore())
        }
    }
    
}
