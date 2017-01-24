import Foundation

public typealias JSON = [String : Any]

public extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any {
    public func toJSONString() -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: []),
            let json = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue) else {
                return nil
        }
        return json as String
    }
}
