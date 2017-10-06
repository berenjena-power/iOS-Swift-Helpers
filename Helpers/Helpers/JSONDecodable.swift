import Foundation

public protocol JSONDecodable {
    static func create(fromJSONData jsonData: Data) -> Self?
    static func create(fromJSON json: JSON) -> Self?
}

public protocol JSONArrayDecodable {
    static func create(fromJSON json: [JSON]) -> [Self]?
}

public extension JSONDecodable {
    public static func create(fromJSONData jsonData: Data) -> Self? {
        do {
            guard let object = try JSONSerialization.jsonObject(with: jsonData, options: []) as? NSDictionary,
                  let json = object as? JSON else {
                return nil
            }
            return create(fromJSON: json)
        } catch {
            return nil
        }
    }
}
