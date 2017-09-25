//
//  GameQuestion.swift
//  whatis_1
//
//  Created by Nitit Rungrojaree on 11/11/2559 BE.
//  Copyright © 2559 Nitit Rungrojaree. All rights reserved.
//

import Foundation
import RealmSwift
class GameQuestion: Object {
    dynamic var mode: Int = 0
    dynamic var imageId: String = ""
    dynamic var answerAndChoice: String = ""
    var arrayAnswerAndChoice: [String] {
        get {
            return answerAndChoice.components(separatedBy: " ")
        }
    }
}
