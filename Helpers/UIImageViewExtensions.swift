import UIKit

public extension UIImageView
{
	public func cropAsCircleWithBorder(borderColor: UIColor, strokeWidth: Int)
	{
        let strokeWidthFloat = CGFloat(strokeWidth)
        
		var radius = min(self.bounds.width, self.bounds.height)
		var drawingRect : CGRect = self.bounds
		drawingRect.size.width = radius
		drawingRect.origin.x = (self.bounds.size.width - radius) / 2
		drawingRect.size.height = radius
		drawingRect.origin.y = (self.bounds.size.height - radius) / 2
		
		radius /= 2
		
		var path = UIBezierPath(roundedRect: drawingRect.insetBy(dx: strokeWidthFloat/2, dy: strokeWidthFloat/2), cornerRadius: radius)
		let border = CAShapeLayer()
		border.fillColor = UIColor.clear.cgColor
		border.path = path.cgPath
		border.strokeColor = borderColor.cgColor
		border.lineWidth = strokeWidthFloat
		self.layer.addSublayer(border)
		
		path = UIBezierPath(roundedRect: drawingRect, cornerRadius: radius)
		let mask = CAShapeLayer()
		mask.path = path.cgPath
		self.layer.mask = mask
	}
}
