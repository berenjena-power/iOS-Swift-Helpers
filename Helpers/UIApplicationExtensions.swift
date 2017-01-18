import Foundation

public extension UIApplication {
    public var statusBarView: UIView {
        return value(forKey: "statusBar") as! UIView
    }
}
