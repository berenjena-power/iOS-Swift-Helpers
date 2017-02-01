import Foundation

public protocol Encodable {
    func toJSON() -> JSON
}

public protocol ArrayEncodable {
    func toJSON() -> [JSON]
}
