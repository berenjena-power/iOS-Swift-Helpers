
import Foundation

public extension Int {
    public var isOdd: Bool {
        return self % 2 == 0
    }
    
    public var isEven: Bool {
        return !self.isOdd
    }
}
