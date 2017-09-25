//
//  Score.swift
//  whatis_1
//
//  Created by Nitit Rungrojaree on 11/10/2559 BE.
//  Copyright © 2559 Nitit Rungrojaree. All rights reserved.
//

import Foundation
import RealmSwift
class Score: Object {
    dynamic var score = 0
    dynamic var total = 0
    dynamic var realScore: Double = 0
    dynamic var name = ""
    dynamic var date = ""
    dynamic var mode = ""
    dynamic var time = ""
}
