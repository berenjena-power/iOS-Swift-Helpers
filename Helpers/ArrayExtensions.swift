import Foundation

public extension Array {
    public func mapOptionals<U>(_ transform: (Element) -> U?) -> [U]? {
        var result: [U] = []
        
        for elem in self {
            if let mapped = transform(elem) {
                result.append(mapped)
            } else {
                return nil
            }
        }
        
        return result
    }
    
    public func element(atIndex index: Int) -> Element? {
        if count > index {
            return self[index]
        }
        return nil
    }
    
    public func find(_ includedElement: (Element) -> Bool) -> Int? {
        for (idx, element) in enumerated() {
            if includedElement(element) {
                return idx
            }
        }
        return nil
    }
    
    public mutating func removeIfFound(_ includedElement: (Element) -> Bool) {
        if let i = self.find(includedElement) {
            self.remove(at: i)
        }
    }
}
