import Foundation
import CommonCrypto

public extension Data {
    public var md5: Data {
        return digest(Digest.md5)
    }
    
    public var sha256: Data {
        return digest(Digest.sha256)
    }
    
    private func digest(_ function: ((UnsafeRawPointer, UInt32) -> [UInt8])) -> Data {
        var hash: [UInt8] = []
        withUnsafeBytes { hash = function($0, UInt32(count)) }
        return Data(bytes: hash, count: hash.count)
    }
    
    var hex: String {
        var string = ""
        enumerateBytes { pointer, count, _ in
            for i in 0..<count {
                string += String(format: "%02x", pointer[i])
            }
        }
        return string
    }
}

struct Digest {
    static func md5(bytes: UnsafeRawPointer, length: UInt32) -> [UInt8] {
        var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(bytes, length, &hash)
        return hash
    }
    
    static func sha256(bytes: UnsafeRawPointer, length: UInt32) -> [UInt8] {
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CC_SHA256(bytes, length, &hash)
        return hash
    }
}
