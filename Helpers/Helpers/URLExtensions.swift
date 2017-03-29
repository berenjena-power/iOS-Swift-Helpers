import Foundation

public extension URL {
    public func URLByAppendingQueryParameters(_ parameters: [String: String]?) -> URL {
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
