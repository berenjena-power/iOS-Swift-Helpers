import Foundation

public func NSLocalizedString(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

public func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: closure)
}
