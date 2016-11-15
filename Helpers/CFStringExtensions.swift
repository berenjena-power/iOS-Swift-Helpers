
import Foundation

extension CFString : Hashable {
    public var hashValue: Int {
        return (self as String).hashValue
    }
}

public func ==(lhs: CFString, rhs: CFString) -> Bool {
    return CFStringCompare(lhs, rhs, CFStringCompareFlags()) == .compareEqualTo
}
