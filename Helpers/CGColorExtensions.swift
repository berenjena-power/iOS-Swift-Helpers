import Foundation

public extension CGColor {
    public func toUIColor() -> UIColor {
        return UIColor(cgColor: self)
    }
}
