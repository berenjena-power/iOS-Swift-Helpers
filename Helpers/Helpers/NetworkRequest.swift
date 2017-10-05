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
            request.setValue("\(message.count)", forHTTPHeaderField: "Content-Lenght")
            request.httpBody = message.data(using: .utf8)
            
            request.httpMethod = Method.post.rawValue
            request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            request.allHTTPHeaderFields = header as? [String: String]
            self.urlRequest = request
            
        case let .rest(method, header, queryString, contentType):
            let urlWithQueryParameters = queryString.isEmpty ? url : url.appendingQueryParameters(queryString)
            var request: URLRequest = URLRequest(url: urlWithQueryParameters)
            
            if let body = contentType.body {
                request.setValue(contentType.httpHeaderValue, forHTTPHeaderField: "Content-Type")
                request.httpBody = body
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
    
    public enum ContentType {
        case json(body: JSON)
        case formURLEncoded(body: Form)
        case form(body: Form, boundary: String)
        case none
    }
    
    public enum RequestType {
        case soap(header: JSON, message: String)
        case rest(method: Method, header: JSON, queryString: [String: String], contentType: ContentType)
    }
    
    public enum Authentication {
        case none, authenticated(AuthenticationLevel)
    }
    
    public enum AuthenticationLevel {
        case userLevel
        case appLevel
    }
}

extension NetworkRequest.ContentType {
    public var httpHeaderValue: String {
        switch self {
        case .json:
            return "application/json"
        case .formURLEncoded:
            return "application/x-www-form-urlencoded"
        case let .form(_, boundary):
            return "multipart/form-data; boundary=\(boundary)"
        case .none:
            return ""
        }
    }
    
    public var body: Data? {
        switch self {
        case let .json(parameters):
            if parameters.isEmpty {
                return nil
            }
            
            return try? JSONSerialization.data(withJSONObject: parameters, options: [])
            
        case let .formURLEncoded(form):
            if form.isEmpty {
                return nil
            }
            
            return form.map({ "\($0)=\($1)" }).joined(separator: "&").data(using: .utf8)
            
        case let .form(form, boundary):
            if form.isEmpty {
                return nil
            }
            
            return MultiPartForm(form: form, boundary: boundary).body
        case .none:
            return nil
        }
    }
}
