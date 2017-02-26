import Foundation

struct MultiPartForm {
    let form: Form
    let boundary: String
    
    init(form: Form, boundary: String = "Boundary-\(UUID().uuidString)") {
        self.form = form
        self.boundary = boundary
    }
    
    var body: Data {
        
        var body = Data()
        
        let boundaryPrefix = "--\(boundary)\r\n"
        
        for (key, value) in form {
            body.appendString(boundaryPrefix)
            body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString("\(value)\r\n")
        }
        
        body.appendString("--".appending(boundary.appending("--")))
        
        return body
    }
}

extension Data {
    mutating func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}
