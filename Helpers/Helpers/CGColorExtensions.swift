import Foundation
import UIKit

public extension CGColor {
    public func toUIColor() -> UIColor {
        return UIColor(cgColor: self)
    }
}
