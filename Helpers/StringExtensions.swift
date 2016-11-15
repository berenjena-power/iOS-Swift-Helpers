import Foundation

public extension String {
    public func base64Encoded() -> String? {
        let plainData = data(using: String.Encoding.utf8)
        let base64String = plainData?.base64EncodedString(options: Data.Base64EncodingOptions.endLineWithCarriageReturn)
        return base64String
    }
    
    public func base64Decoded() -> String? {
        guard let decodedData = Data(base64Encoded: self) else {
            return nil
        }
        let decodedString = NSString(data: decodedData as Data, encoding: String.Encoding.utf8.rawValue)
        return decodedString as? String
    }
    
    public func containsAnyCharacterOfSet(_ set: CharacterSet) -> Bool {
        for character in self.characters {
            for codeUnit in String(character).utf16 {
                if set.contains(UnicodeScalar(codeUnit)!) {
                    return true
                }
            }
        }
        
        return false
    }
    
    public func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    public var length: Int {
        return characters.count
    }
    
    public func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    public func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    public func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    public func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}
