import Foundation

public struct Value: ValueProtocol, CustomStringConvertible, Decodable, Encodable {
    public let id: Int
    public var value: String
    
    public init(id: Int, value: String) {
        self.id = id
        self.value = value
    }
    
    // MARK: - Protocol Decodable:
    public static func create(fromJSON json: JSON) -> Value? {
        guard let id = json["id"] as? Int,
              let value = json["value"] as? String else {
                print("❌❌❌ Invalid Value metadata!")
                return nil
        }
        
        return Value(id: id, value: value)
    }
    
    // MARK: - Protocol Encodable:
    public func toJSON() -> JSON {
        return ["id": id, "value": value]
    }
    
    // MARK: - Protocol CustomStringConvertible:
    public var description: String {
        return "Value: \(id) ➡ \(value)"
    }
}

public protocol ValueProtocol: Equatable {
    var id: Int { get }
    var value: String { get }
}

public extension Sequence where Iterator.Element == Value {
    public func find(byValueId id: Int) -> Value? {
        if let element = filter({ $0.id == id }).first {
            return element
        }
        return nil
    }
}

public extension Array where Element: ValueProtocol {
    mutating public func upsert(value: Element) {
        if let element = filter({ $0 == value }).first,
           let index = index(of: element) {
            remove(at: index)
            insert(value, at: index)
        } else {
            append(value)
        }
    }
    
    mutating public func replace(valueId id: Int, withValue value: String) -> Bool {
        guard let newElement = Value(id: id, value: value) as? Element else {
            return false
        }
        if let element = filter({ $0.id == id }).first,
           let index = index(of: element) {
            remove(at: index)
            insert(newElement, at: index)
            return true
        }
        return false
    }
}

public func == (lhs: Value, rhs: Value) -> Bool {
    return lhs.id == rhs.id
}
