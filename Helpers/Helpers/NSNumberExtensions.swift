import Foundation

public extension NSNumber {
    public var int64CustomValue: Int64 {
        let number = NSNumber(value: doubleValue.doubleRounded(toPlaces: 2).multiplied(by: pow(10.0, Double(2))))
        let format = NumberFormatter()
        format.maximumFractionDigits = 2
        let result: String = format.string(from: number)!
        return Int64(result)!
    }
}
