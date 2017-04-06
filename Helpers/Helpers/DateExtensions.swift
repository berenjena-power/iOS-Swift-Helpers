import Foundation

public extension Date {
    public var firstDayOfCurrentMonth: Date {
        return (Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self)))!
    }
    
    public var isFirstDayOfCurrentMonth: Bool {
        return self == firstDayOfCurrentMonth
    }
    
    public var firstHourOfCurrentDate: Date {
        return (Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)))!
    }
    
    public var lastDayOfCurrentMonth: Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: firstDayOfCurrentMonth)!
    }

    public var year: Int {
        let calendar = Calendar.current
        return calendar.component(.year, from: self)
    }

    public var month: Int {
        let calendar = Calendar.current
        return calendar.component(.month, from: self)
    }

    public var day: Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: self)
    }
    
    public var hour: Int {
        let calendar = Calendar.current
        return calendar.component(.hour, from: self)
    }
    
    public var minute: Int {
        let calendar = Calendar.current
        return calendar.component(.minute, from: self)
    }
    
    public func toFormattedSpanishDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let converted = dateFormatter.string(from: self)
        return converted
    }
    
    public func toFormattedSpanishFullDateString(useHourSuffix: Bool = true) -> String {
        let dateFormatter = DateFormatter()
        if useHourSuffix {
            dateFormatter.dateFormat = "dd/MM/yyyy - HH:mm'h.'"
        } else {
            dateFormatter.dateFormat = "dd/MM/yyyy - HH:mm"
        }
        let converted = dateFormatter.string(from: self)
        return converted
    }
    
    public func toFormattedSpanishFullDateString(withEndDate end: Date, useHourSuffix: Bool = true) -> String {
        let datef = DateFormatter()
        datef.dateFormat = "dd/MM/yyyy"
        let timef = DateFormatter()
        if useHourSuffix {
            timef.dateFormat = "HH:mm'h.'"
        } else {
            timef.dateFormat = "HH:mm"
        }
        
        return "\(datef.string(from: self)) - \(timef.string(from: self)) a \(timef.string(from: end))"
    }
    
    public func toFormattedSpanishMonthName() -> String {
        let datef = DateFormatter()
        datef.dateFormat = "M MMMM"
        
        return "\(datef.string(from: self))"
    }

    public func toFormattedJsonDateString(useUtc: Bool = true) -> String {
        let dateFormatter = DateFormatter()
        if useUtc {
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        }
        let converted = dateFormatter.string(from: self)
        return converted
    }

    public func toFormattedPOSIXDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter.string(from:self)
    }
    
    public func dateByAdding(years: Int) -> Date {
        let components = DateComponents(year: years)
        return Calendar.current.date(byAdding: components, to: self)!
    }
    
    public func dateByAdding(days: Int) -> Date {
        let components = DateComponents(day: days)
        return Calendar.current.date(byAdding: components, to: self)!
    }
    
    public func dateByAdding(months: Int) -> Date {
        let components = DateComponents(month: months)
        return Calendar.current.date(byAdding: components, to: self)!
    }
    
    public func dateByAdding(hours: Int) -> Date {
        let components = DateComponents(minute: minute)
        return Calendar.current.date(byAdding: components, to: self)!
    }

    public func dateByAdding(minutes: Int) -> Date {
        let components = DateComponents(minute: minute)
        return Calendar.current.date(byAdding: components, to: self)!
    }
    
    public func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date.firstDayOfCurrentMonth, to: self.firstDayOfCurrentMonth).month ?? 0
    }
    
    public func totalAbsoluteMonths(from date: Date) -> Int {
        return self.months(from: date) + 1
    }
    
    public var localTime: Time {
        let timef = DateFormatter()
        timef.dateFormat = "HH:mm:ss"
        
        let timeString = timef.string(from: self)
        let components = timeString.components(separatedBy: ":")
        
        return Time(hour: Int(components[0])!, minute: Int(components[1])!, seconds: Int(components[2])!)
    }
}
