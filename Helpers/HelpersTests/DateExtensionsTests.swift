import XCTest
import Helpers

class DateExtensionsTests: XCTestCase {
    let secondsOfOneDay = 86400

    func testAddDays() {
        let date = "08/04/2017".toDateFromSpanishFormat()!
        
        let newDate = date.dateByAdding(days: 1)
        
        XCTAssertEqual(newDate, date + TimeInterval(secondsOfOneDay))
    }
}
