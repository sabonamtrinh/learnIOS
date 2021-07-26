//
//  NSDate+Extesion.swift
//  OT
//
//  Created by namtrinh on 26/07/2021.
//

import Foundation

extension NSDate {
    static func calculateDate(day: Int, month: Int, year: Int) -> NSDate {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let calculateDate = formatter.date(from: "\(year)/\(month)/\(day) 0:0") as NSDate?
        return calculateDate!
    }
}
