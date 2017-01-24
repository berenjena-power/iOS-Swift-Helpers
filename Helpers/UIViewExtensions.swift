import UIKit
import Foundation

public extension UIView {
    public func alignToView(_ view: UIView) {
        addConstraintToView(view, attribute: .top, constant: 0)
        addConstraintToView(view, attribute: .bottom, constant: 0)
        addConstraintToView(view, attribute: .leading, constant: 0)
        addConstraintToView(view, attribute: .trailing, constant: 0)
    }
    
    private func addConstraintToView(_ view: UIView, attribute: NSLayoutAttribute, constant: CGFloat) {
        addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: .equal, toItem: self, attribute: attribute, multiplier: 1.0, constant: constant))
    }
}
