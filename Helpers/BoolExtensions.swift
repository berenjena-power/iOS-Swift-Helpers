
import Foundation

public extension Bool {
    public func toString() -> String {
        return self ? "true" : "false"
    }
    
    public var isFalse: Bool {
        get {
            return !self
        }
    }
}
