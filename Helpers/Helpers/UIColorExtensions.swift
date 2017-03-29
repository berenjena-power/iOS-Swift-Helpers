import Foundation
import UIKit

public extension UIColor {
    public static func fromHex(_ hexColor: String) -> UIColor {
        var rgbValue: UInt32 = 0
        Scanner(string: hexColor.replacingOccurrences(of: "#", with: "")).scanHexInt32(&rgbValue)
        
        let components = (
            R: CGFloat((rgbValue >> 16) & 0xff) / 255,
            G: CGFloat((rgbValue >> 08) & 0xff) / 255,
            B: CGFloat((rgbValue >> 00) & 0xff) / 255
        )
        
        let cgColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [components.R, components.G, components.B, 1])!
        
        return cgColor.toUIColor()
    }
}
