import Foundation

public extension UIApplication {
    public var statusBar: UIView {
        let statusBar = value(forKey: "statusBar") as! UIView
        return statusBar
    }
}
