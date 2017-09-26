import Foundation
import UIKit

public extension UICollectionView {
    public func register<T: UICollectionViewCell>(_ type: T.Type) {
        register(T.nib, forCellWithReuseIdentifier: T.nibName)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.nibName, for: indexPath) as? T else {
            fatalError("\(T.nibName) could not be dequeued for \(indexPath) as \(T.self)")
        }
        
        return cell
    }
    
    public func dequeueReusableSupplementaryView<T: UICollectionViewCell>(kind: String, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.nibName, for: indexPath) as? T else {
            fatalError("\(T.nibName) could not be dequeued for \(indexPath) of kind \(kind) as \(T.self)")
        }
        
        return cell
    }
}
