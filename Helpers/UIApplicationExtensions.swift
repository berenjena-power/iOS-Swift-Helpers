import Foundation

public extension UIApplication {
    public var statusBar: UIView {
        let statusBar = UIApplication.shared.value(forKey: "statusBar") as! UIView
        return statusBar
    }
}
