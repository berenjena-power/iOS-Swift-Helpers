import Foundation

public extension TimeInterval {
    public var milliseconds: Int {
        let whole = floor(self)
        let decimal = self - whole
        
        let numberString = String(decimal)
        let parts = numberString.components(separatedBy: ".")
        var final = parts[1]
        var i = parts[1].characters.count
        while i < 3 {
            final += "0"
            i += 1
        }
        let index = final.index(final.startIndex, offsetBy: 2)
        final = "\(Int(whole))" + final[...index]
        return Int(final)!
    }
}
