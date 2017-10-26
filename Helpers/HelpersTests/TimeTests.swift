import XCTest

class TimeTests: XCTestCase {
    func testAdd15Seconds() {
        let time = Time(hours: 5, minutes: 30, seconds: 15)
        
        let newTime = time.timeByAdding(seconds: 15)
        
        XCTAssertEqual(newTime, Time(hours: 5, minutes: 30, seconds: 30))
    }

    func testAdd30SecondsAndChangeMinutes() {
        let time = Time(hours: 13, minutes: 20, seconds: 45)
        
        let newTime = time.timeByAdding(seconds: 30)
        
        XCTAssertEqual(newTime, Time(hours: 13, minutes: 21, seconds: 15))
    }
    
    func testAdd90SecondsAndChangeMinutes() {
        let time = Time(hours: 13, minutes: 0, seconds: 0)
        
        let newTime = time.timeByAdding(seconds: 90)
        
        XCTAssertEqual(newTime, Time(hours: 13, minutes: 1, seconds: 30))
    }
    
    func testAdd1SecondAndChangeHour() {
        let time = Time(hours: 13, minutes: 59, seconds: 59)
        
        let newTime = time.timeByAdding(seconds: 1)
        
        XCTAssertEqual(newTime, Time(hours: 14, minutes: 0, seconds: 0))
    }
    
    func testAdd900SecondsAndChangeMinutesAndHours() {
        let time = Time(hours: 13, minutes: 50, seconds: 0)
        
        let newTime = time.timeByAdding(seconds: 900)
        
        XCTAssertEqual(newTime, Time(hours: 14, minutes: 5, seconds: 0))
    }
    
    func testFormatTime() {
        let time = Time(hours: 13, minutes: 2, seconds: 6)
        
        let format = time.description
        
        XCTAssertEqual(format, "13:02:06")
    }
    
    func testTotalSeconds() {
        XCTAssertEqual(Time(hours: 0, minutes: 0, seconds: 10).totalSeconds, 10)
        XCTAssertEqual(Time(hours: 0, minutes: 30, seconds: 10).totalSeconds, 1810)
        XCTAssertEqual(Time(hours: 1, minutes: 0, seconds: 10).totalSeconds, 3610)
    }

    func testStrideBy315Times() {
        let start = Time(hours: 13, minutes: 10, seconds: 0)
        let end = Time(hours: 13, minutes: 15, seconds: 15)

        let times = stride(from: start, to: end, by: +1)

        XCTAssertEqual(times.sorted().count, 315)
    }
}
