import Foundation

public extension UIApplication {
    public var statusBar: UIView {
        return value(forKey: "statusBar") as! UIView
    }
}
