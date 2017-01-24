import Foundation

public extension UITableViewCell {
	public static func nibString() -> String {
		return NSStringFromClass(self).components(separatedBy: ".").last!
	}
	
	public static func nib() -> UINib {
		return UINib(nibName: nibString(), bundle: nil)
	}
}
