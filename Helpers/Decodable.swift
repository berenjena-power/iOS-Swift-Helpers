import Foundation

protocol Decodable {
    static func create(fromJSONData jsonData: Data) -> Self?
    static func create(fromJSON json: JSON) -> Self?
}

protocol ArrayDecodable {
    static func create(fromJSON json: [JSON]) -> [Self]?
}

extension Decodable {
    static func create(fromJSONData jsonData: Data) -> Self? {
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

protocol Encodable {
    func toJSON() -> JSON?
}

protocol ArrayEncodable {
    func toJSON() -> [JSON]?
}
