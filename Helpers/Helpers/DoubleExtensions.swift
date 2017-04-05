import Foundation

public extension Double {
    public func doubleRounded(toPlaces places: Int = 2) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
