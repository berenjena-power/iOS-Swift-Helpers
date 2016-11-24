//: Playground - noun: a place where people can play

import UIKit
import Helpers

let a = Date()
a.toFormattedSpanishFullDateString(withEndDate: Date() + 300)

let dateFormatter = DateFormatter()
dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
let converted = dateFormatter.string(from: Date())


let bb = "2016-11-10T23:00:00Z"
bb.toDateFromJsonFormat()?.toFormattedJsonDateString(useUtc: false)

let aa = (Date(), Date())
