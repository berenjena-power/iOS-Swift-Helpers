import Foundation

public protocol Decodable {
    static func create(fromJSONData jsonData: Data) -> Self?
    static func create(fromJSON json: JSON) -> Self?
}

public protocol ArrayDecodable {
    static func create(fromJSON json: [JSON]) -> [Self]?
}

public extension Decodable {
    public static func create(fromJSONData jsonData: Data) -> Self? {
        do {
            guard let object = try JSONSerialization.jsonObject(with: jsonData, options: []) as? NSDictionary else {
                return nil
            }
            return create(fromJSON: object as! JSON)
        } catch {
            return nil
        }
    }
}

public protocol Encodable {
    func toJSON() -> JSON?
}

public protocol ArrayEncodable {
    func toJSON() -> [JSON]?
}
