import XCTest
import Helpers

class IOSDeviceTests: XCTestCase {
    func testDeviceInfo() {
        let device = IOSDevice()
        let uiDevice = UIDevice.current
        
        XCTAssertEqual(device.deviceModel, uiDevice.deviceModel.name)
        XCTAssertEqual(device.osName, uiDevice.systemName)
        XCTAssertEqual(device.osVersion, uiDevice.systemVersion)
        XCTAssertEqual(device.identifierForVendor, uiDevice.identifierForVendor?.uuidString)
    }
}

