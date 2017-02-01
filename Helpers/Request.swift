import Foundation

public class NetworkRequest {
    let url: URL
    let method: Method
    var auth: Authentication
    let queryStringParameters: [String: String]
    let header: JSON
    let soapMessage: String
    let parameters: JSON
    
    public init(url: URL, method: Method, auth: Authentication, queryStringParameters: [String: String], header: JSON, soapMessage: String = "", parameters: JSON = [:]) {
        self.url = url
        self.method = method
        self.auth = auth
        self.queryStringParameters = queryStringParameters
        self.header = header
        self.soapMessage = soapMessage
        self.parameters = parameters
    }
    
    public var urlRequest: URLRequest {
        let urlWithQueryParameters = queryStringParameters.isEmpty ?
            url :
            url.URLByAppendingQueryParameters(queryStringParameters)
        var request: URLRequest = URLRequest(url: urlWithQueryParameters)
        
        if soapMessage.isNotEmpty {
            request.setValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.setValue(urlWithQueryParameters.absoluteString, forHTTPHeaderField: "SOAPAction")
            request.setValue("\(soapMessage.length)", forHTTPHeaderField: "Content-Lenght")
            request.httpBody = soapMessage.data(using: .utf8)
        }
        
        if parameters.isNotEmpty {
            if let data = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = data
            }
        }
        
        request.httpMethod = method.rawValue
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = header as? [String: String]
        return request
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
    
    public enum Authentication {
        case none, authenticated(AuthenticationLevel)
    }
    
    public enum AuthenticationLevel {
        case userLevel
        case appLevel
    }
}
