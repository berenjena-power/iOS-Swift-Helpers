public protocol Device {
    var osName: String { get }
    var osVersion: String { get }
    var deviceModel: String { get }
    var identifierForVendor: String { get }
}

public struct IOSDevice: Device {
    public init() {
        
    }
    
    public var osName: String {
        return "ios"
    }
    
    public var osVersion: String {
        return UIDevice.current.systemVersion
    }
    
    public var deviceModel: String {
        return UIDevice.current.deviceModel.name
    }
    
    public var identifierForVendor: String {
        guard let identifier = UIDevice.current.identifierForVendor?.uuidString else {
            fatalError("Identifier for vendor must exist")
        }
        return "\(identifier)"
    }
}
