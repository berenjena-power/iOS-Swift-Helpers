import Foundation

public extension UIApplication {
    public var currentStatusBar: UIView {
        return value(forKey: "statusBar") as! UIView
    }
}
