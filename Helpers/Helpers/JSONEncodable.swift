import Foundation

public protocol JSONEncodable {
    func toJSON() -> JSON
}

public protocol JSONArrayEncodable {
    func toJSON() -> [JSON]
}
