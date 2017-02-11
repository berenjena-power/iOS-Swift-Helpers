//: Playground - noun: a place where people can play

import UIKit
import Helpers

let a = Date()
a.toFormattedSpanishFullDateString(withEndDate: Date() + 300)
a.day
a.month
a.year

a.dateByAdding(days: -32)
a.dateByAdding(months: -1)
a.dateByAdding(years: 23)

let dateFormatter = DateFormatter()
dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
let converted = dateFormatter.string(from: Date())


let bb = "2016-11-10T23:00:00Z"
bb.toDateFromJsonFormat()?.toFormattedJsonDateString(useUtc: false)

Date().toFormattedSpanishFullDateString()
Date().toFormattedSpanishFullDateString(withEndDate: Date() + 5000)

let azzz1 = Time(hour: 2, minute: 2, seconds: 3)
let azzz2 = Time(hour: 2, minute: 5, seconds: 3)
let azzz3 = Time(timeString: "14:33:45")?.seconds
let azzz4 = Time(timeString: "12:32")?.seconds
let acasa = azzz1 < azzz2

azzz1.toFormattedTimeString()
azzz1.toFormattedTimeString(showSeconds: true)


let cosas = ["Cróssfit", "baba", "caca", "culo"]
cosas.anyMatch(with: "crossfit baba")
"baBA".match(inAny: cosas)
"https://es.linkedin.com/in/sebastianvarelabasconi".isValidLinkedinProfileUrl()
"https://es.linkedin.com/in/sebastianvarelabasconi".linkedInUsername

