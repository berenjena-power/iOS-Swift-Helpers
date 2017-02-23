import Foundation

public class NetworkRequest {
    public let url: URL
    public let requestType: RequestType
    public private(set)var urlRequest: URLRequest
    
    public init(url: URL, requestType: RequestType) {
        self.url = url
        self.requestType = requestType
        
        // Request
        switch requestType {
        case let .soap(header, message):
            var request: URLRequest = URLRequest(url: url)
            
            request.setValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.setValue(url.absoluteString, forHTTPHeaderField: "SOAPAction")
            request.setValue("\(message.length)", forHTTPHeaderField: "Content-Lenght")
            request.httpBody = message.data(using: .utf8)
            
            request.httpMethod = Method.post.rawValue
            request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            request.allHTTPHeaderFields = header as? [String: String]
            self.urlRequest = request
            
        case let .rest(method, header, parameters, queryString):
            let urlWithQueryParameters = queryString.isEmpty ? url : url.URLByAppendingQueryParameters(queryString)
            var request: URLRequest = URLRequest(url: urlWithQueryParameters)
            
            if parameters.isNotEmpty,
                let data = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = data
            }
            
            request.httpMethod = method.rawValue
            request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            request.allHTTPHeaderFields = header as? [String: String]
            self.urlRequest = request
        }
    }
    
    public func add(headers: [String: String]) {
        urlRequest.allHTTPHeaderFields?.update(other: headers)
    }
    
    public enum Method: String {
        case options = "OPTIONS"
        case get     = "GET"
        case head    = "HEAD"
        case post    = "POST"
        case put     = "PUT"
        case patch   = "PATCH"
        case delete  = "DELETE"
        case trace   = "TRACE"
        case connect = "CONNECT"
    }
    
    public enum ResponseType {
        case array
        case object
        case none
    }
    
    public enum RequestType {
        case soap(header: JSON, message: String)
        case rest(method: Method, header: JSON, parameters: JSON, queryString: [String: String])
    }
    
    public enum Authentication {
        case none, authenticated(AuthenticationLevel)
    }
    
    public enum AuthenticationLevel {
        case userLevel
        case appLevel
    }
}
