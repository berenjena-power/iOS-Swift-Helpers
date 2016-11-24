
import UIKit
import Foundation

extension UIViewController {
    static var topVisibleViewController: UIViewController? {
        if var tc = UIApplication.shared.keyWindow?.rootViewController {
            while let vc = tc.presentedViewController {
                tc = vc
            }
            return tc
        }
        return nil
    }
    
    var topVisibleViewController: UIViewController {
        if let tc = UIViewController.topVisibleViewController {
            return tc
        }
        return self
    }
}
