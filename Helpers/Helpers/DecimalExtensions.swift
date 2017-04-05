import Foundation

public extension Decimal {
    public var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
