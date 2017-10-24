import Foundation
import UIKit

public extension UITableView {
    public func register<T: UITableViewCell>(_ type: T.Type) {
        register(T.nib, forCellReuseIdentifier: T.nibName)
    }

    public func register<H: UITableViewHeaderFooterView>(_ type: H.Type) {
        register(H.nib, forHeaderFooterViewReuseIdentifier: H.nibName)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.nibName) as? T else {
            fatalError("\(T.nibName) could not be dequeued as \(T.self)")
        }
        
        return cell
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.nibName, for: indexPath) as? T else {
            fatalError("\(T.nibName) could not be dequeued for \(indexPath) as \(T.self)")
        }
        
        return cell
    }

    public func dequeueReusableHeaderFooterView<H: UITableViewHeaderFooterView>() -> H {
        guard let header = dequeueReusableHeaderFooterView(withIdentifier: H.nibName) as? H else {
            fatalError("\(H.nibName) could not be dequeued as \(H.self)")
        }
        
        return header
    }
}
