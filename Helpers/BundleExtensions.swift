
import Foundation

public extension Bundle {
    public var buildVersion: String {
        return object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }
    
    public var appVersion: String {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    public var applicationReadableVersion: String {
        let mainBundle = Bundle.main
        return "v\(mainBundle.appVersion) (\(mainBundle.buildVersion))"
    }
}
