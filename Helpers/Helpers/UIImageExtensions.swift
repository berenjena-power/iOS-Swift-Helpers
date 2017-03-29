import UIKit

public extension UIImage {
	
	public var rounded: UIImage? {
		let imageView = UIImageView(image: self)
		imageView.layer.cornerRadius = min(size.height / 4, size.width / 4)
		imageView.layer.masksToBounds = true
		UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
		guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
		imageView.layer.render(in: context)
		let result = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
        
		return result
	}
	
	public var circle: UIImage? {
		let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
		let imageView = UIImageView(frame: CGRect(origin: .zero, size: square))
		imageView.contentMode = .scaleAspectFill
		imageView.image = self
		imageView.layer.cornerRadius = square.width / 2
		imageView.layer.masksToBounds = true
		UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
		guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
		imageView.layer.render(in: context)
		let result = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
        
		return result
	}
}
