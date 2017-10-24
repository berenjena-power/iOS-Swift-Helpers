import Foundation
import UIKit

public extension UITableViewHeaderFooterView {
    public static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
}
