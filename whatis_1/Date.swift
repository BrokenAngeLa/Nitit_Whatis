//
//  Date.swift
//  whatis_1
//
//  Created by Nitit Rungrojaree on 10/18/2559 BE.
//  Copyright © 2559 Nitit Rungrojaree. All rights reserved.
//

import Foundation
class Date{

    var num: String!
    
    init(day: Int, month: Int, year: Int) {
        num = String(validatingUTF8: "\(day)/\(month)/\(year)")!
    }
    
    init(hour: Int,minute: Int,second: Int) {
        let hour = hour < 10 ? "0\(hour)" : "\(hour)"
        let minute = minute < 10 ? "0\(minute)" : "\(minute)"
        let second = second < 10 ? "0\(second)" : "\(second)"
        num = "\(hour):\(minute):\(second)"
    }
    
    static func getDate() -> String {
        let date = dateNum()
        return date.num
    }
    
    static func getTime() -> String {
        let date = timeNum()
        return date.num
    }
    
    static func dateNum() -> Date {
        let components = (Calendar.current as NSCalendar).components([.day, .month, .year], from: Foundation.Date())
        return Date(day: components.day!, month: components.month!, year: components.year!)
    }
    
    static func timeNum() -> Date {
        let calendar = NSCalendar.current
        let hour = calendar.component(.hour, from: Foundation.Date())
        let minutes = calendar.component(.minute, from: Foundation.Date())
        let second = calendar.component(.second, from: Foundation.Date())
        
        //let components = (Calendar.current as NSCalendar).component([.second, .minute, .hour], from: Foundation.Date())
        return Date(hour: hour, minute: minutes,second: second)
    }
}
