import Foundation

public extension UIApplication {
    public var statusBarView: UIView {
        guard let sbv = value(forKey: "statusBar") as? UIView else {
            return UIView()
        }
        return sbv
    }
}
