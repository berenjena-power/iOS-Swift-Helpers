import Foundation
import EventKit

public extension EKParticipant {
    public var email: String? {
        // Try to get email from inner property
        if let email = value(forKey: "emailAddress") as? String {
            return email
        }
        
        // Getting info from description
        let emailComponents = description.components(separatedBy: "email = ")
        if emailComponents.isNotEmpty {
            let email = emailComponents[1].components(separatedBy: ";").first
            return email
        }
        
        // Getting from url (only on iOS10+)
        if #available(iOS 10.0, *) {
            let emailFromURL = url.absoluteString.replacingOccurrences(of: "mailto:", with: "")
            if emailFromURL.isValidEmail() {
                return emailFromURL
            }
        }
        return nil
    }
    
    public var emailDomain: String? {
        if let email = email {
            return email.components(separatedBy: "@").last ?? ""
        }
        return nil
    }
}
