
import Foundation

public extension Date {
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
    
    var localTime: Time {
        get {
            let timef = DateFormatter()
            timef.dateFormat = "HH:mm:ss"
            
            let timeString = timef.string(from: self)
            let components = timeString.components(separatedBy: ":")
            
            return Time(hour: Int(components[0])!, minute: Int(components[1])!, seconds: Int(components[2])!)
        }
    }
}
