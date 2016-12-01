
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
