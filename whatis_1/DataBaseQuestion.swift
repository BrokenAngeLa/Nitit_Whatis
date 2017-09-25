//
//  DataBaseQuestion.swift
//  whatis_1
//
//  Created by student on 10/20/16.
//  Copyright © 2016 Nitit Rungrojaree. All rights reserved.
//
import Foundation
import RealmSwift
class DataBaseQuestion {

    static func addQuestion(_ imageId: String,answerAndChoice: String,mode: Int) {
        let realm = try! Realm()
        let question = GameQuestion()
        question.mode = mode
        question.imageId = imageId
        question.answerAndChoice = answerAndChoice
        try! realm.write {
            realm.add(question)
        }
    }
    
    static func getQuestion(num: Int) -> Results<GameQuestion>! {
        let realm = try! Realm()
        return realm.objects(GameQuestion.self).filter("mode == %d", num)
    }

    static func getCount(num: Int) -> Int {
        let realm = try! Realm()
        return realm.objects(GameQuestion.self).filter("mode == %d", num).count
    }
    
    static func deleteQuestion() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    static func addQuestionTest() {
        // Vegetarian
        addQuestion("Image0", answerAndChoice: "Lemon Banana Cucumber Bean Banana", mode: 0)
        addQuestion("Image1", answerAndChoice: "tomato Banana Carrrot Bean Bean", mode: 0)
        addQuestion("Image2", answerAndChoice: "Broccoli Banana Apple Pineapple Broccoli", mode: 0)
        addQuestion("Image3", answerAndChoice: "Tomato Carrrot Garlic Pineapple Carrrot", mode: 0)
        addQuestion("Image4", answerAndChoice: "Tomato Cherry Apple Garlic Cherry", mode: 0)
        addQuestion("Image5", answerAndChoice: "Cucumber Broccoli Apple Lemon Cucumber", mode: 0)
        addQuestion("Image6", answerAndChoice: "Tomato Banana Garlic Pineapple Garlic", mode: 0)
        addQuestion("Image7", answerAndChoice: "Broccoli Kiwi apple Grape Grape", mode: 0)
        addQuestion("Image8", answerAndChoice: "Kiwi Grape Apple Lemon Kiwi", mode: 0)
        addQuestion("Image9", answerAndChoice: "Tomato Lemon Apple Pineapple Lemon", mode: 0)
        //Country
        addQuestion("us", answerAndChoice: "US France Germany Israel US", mode: 1)
        addQuestion("fr", answerAndChoice: "China Germany France SouthKorea France", mode: 1)
        addQuestion("de", answerAndChoice: "Germany Italy Apple Brazil Germany", mode: 1)
        addQuestion("br", answerAndChoice: "Brazil Italy Germany SouthKorea Brazil", mode: 1)
        addQuestion("it", answerAndChoice: "France Brazil Italy China Italy", mode: 1)
        addQuestion("kr", answerAndChoice: "Italy Brazil SouthKorea Australia SouthKorea", mode: 1)
        addQuestion("au", answerAndChoice: "Italy Australia Brazil SouthKorea Australia", mode: 1)
        addQuestion("cn", answerAndChoice: "SouthKorea China Australia Brazil China", mode: 1)
        addQuestion("il", answerAndChoice: "SouthKorea Israel Germany China Israel", mode: 1)
        addQuestion("th", answerAndChoice: "Thailand Israel Germany China Thailand", mode: 1)
        //animal
        addQuestion("b1", answerAndChoice: "Fox Elephant Cat Lion Cat", mode: 2)
        addQuestion("b2", answerAndChoice: "Rabbit Cat Pig Rat Rabbit", mode: 2)
        addQuestion("b3", answerAndChoice: "Elephant Pig Dog Fish Pig", mode: 2)
        addQuestion("b4", answerAndChoice: "Fish Elephant Lion Dog Dog", mode: 2)
        addQuestion("b5", answerAndChoice: "Rat Fox Bat Raccoon Rat", mode: 2)
        addQuestion("b6", answerAndChoice: "Rat Bird Dog Cat Bird", mode: 2)
        addQuestion("b7", answerAndChoice: "Snake Raccoon Elephant Rabbit Elephant", mode: 2)
        addQuestion("b8", answerAndChoice: "Lion Raccoon Rabbit Turtle Raccoon", mode: 2)
        addQuestion("b9", answerAndChoice: "Snack Fox Dog Fish Fox", mode: 2)
        addQuestion("b10", answerAndChoice: "Tiger Snack Turtle Lion Turtle", mode: 2)
    }
}
