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
    
    public func toDateFromJsonFormat() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateObj = dateFormatter.date(from: self)
        
        return dateObj
    }

    public func toDateFromSpanishFormat() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateObj = dateFormatter.date(from: self)
        
        return dateObj
    }

    public var isNotEmpty: Bool {
        return !self.isEmpty
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
    
    public func substring(with range: Range<Int>) -> String {
        let startIndex = index(from: range.lowerBound)
        let endIndex = index(from: range.upperBound)
        return substring(with: startIndex..<endIndex)
    }
    
    public func isMatched(by occurrences: [String]) -> Bool {
        return occurrences.matchWith(occurrence: self)
    }
    
    public func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

public extension Sequence where Iterator.Element == String {
    public func matchWith(occurrence: String) -> Bool {
        return contains(where: { el in
            return occurrence.range(of: el, options: [.diacriticInsensitive, .caseInsensitive], range: nil, locale: nil) != nil
        })
    }
}
