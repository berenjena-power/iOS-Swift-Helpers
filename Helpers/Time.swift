
import Foundation

public struct Time: Comparable {
    public let hour: Int
    public let minute: Int
    public let seconds: Int
    
    public init(hour: Int, minute: Int, seconds: Int) {
        self.hour = hour
        self.minute = minute
        self.seconds = seconds
    }
    
    public init?(timeString: String) {
        let components = timeString.components(separatedBy: ":")
        
        guard components.count == 2 || components.count == 3 else {
            return nil
        }
        guard let h = Int(components[0]), let m = Int(components[1]) else {
            return nil
        }
        
        self.hour = h
        self.minute = m
        
        if components.count == 3 {
            guard let s = Int(components[2]) else {
                return nil
            }
            self.seconds = s
        } else {
            self.seconds = 0
        }
    }
}

public func ==(lhs: Time, rhs: Time) -> Bool {
    return lhs.hour == rhs.hour && lhs.minute == rhs.minute && lhs.seconds == rhs.seconds
}

public func <(lhs: Time, rhs: Time) -> Bool {
    if lhs.hour == rhs.hour && lhs.minute == rhs.minute {
        return lhs.seconds < rhs.seconds
    }
    if lhs.hour == rhs.hour {
        return lhs.minute < rhs.minute
    }
    return lhs.hour < rhs.hour
}
