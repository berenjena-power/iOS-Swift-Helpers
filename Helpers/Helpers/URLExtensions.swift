import Foundation

public extension URL {
    public func starts(with url: URL) -> Bool {
        return self.absoluteString.starts(with: url.absoluteString)
    }

    public func appendingQueryParameters(_ parameters: [String: String]?) -> URL {
        guard let parameters = parameters,
              var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
                return self
        }
        
        var mutableQueryItems: [URLQueryItem] = urlComponents.queryItems ?? []
        mutableQueryItems.append(contentsOf: parameters.map { URLQueryItem(name: $0, value: $1) })
        urlComponents.queryItems = mutableQueryItems
        return urlComponents.url!
    }
}
