import Crypto

public protocol Device {
    var osName: String { get }
    var osVersion: String { get }
    var deviceModel: String { get }
    var identifierForVendor: String { get }
    var footprint: String { get }
}

public struct IOSDevice: Device {
    public init() {
        
    }
    
    public var osName: String {
        return UIDevice.current.systemName
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

    public var footprint: String {
        guard let identifierForVendorSha256 = identifierForVendor.sha256,
              let modelSha256 = deviceModel.sha256,
              let systemNameSha256 = osName.sha256 else {
            fatalError("fail to get hashes")
        }
        guard let superHash = "\(identifierForVendorSha256)\(modelSha256)\(systemNameSha256)".sha256 else {
            fatalError("fail to get super hash")
        }
        return superHash.base64Encoded()
    }
}
