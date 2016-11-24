
import Foundation

public extension Date {
    public func toFormattedSpanishDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let converted = dateFormatter.string(from: self)
        return converted
    }
    
    public func toFormattedSpanishFullDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - HH:mm"
        let converted = dateFormatter.string(from: self)
        return converted
    }
    
    public func toFormattedSpanishFullDateString(withEndDate end: Date) -> String {
        let datef = DateFormatter()
        datef.dateFormat = "dd/MM/yyyy"
        let timef = DateFormatter()
        timef.dateFormat = "HH:mm"
        
        return "\(datef.string(from: self)) - \(timef.string(from: self)) a \(timef.string(from: end))"
    }

    public func toFormattedJsonDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let converted = dateFormatter.string(from: self)
        return converted
    }
}
