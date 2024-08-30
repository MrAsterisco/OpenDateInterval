import XCTest
@testable import OpenDateInterval

final class OpenDateIntervalTests: XCTestCase {
	func testInit() {
		// GIVEN
		let startDate = Date(timeIntervalSinceReferenceDate: 0)
		let endDate = Date(timeIntervalSinceReferenceDate: 1)
		
		let interval = OpenDateInterval(start: startDate, end: endDate)
		
		// THEN
		XCTAssertEqual(interval.start, startDate)
		XCTAssertEqual(interval.end, endDate)
	}
	
	func testOpenInit() {
		// GIVEN
		let startDate = Date(timeIntervalSinceReferenceDate: 0)
		
		let interval = OpenDateInterval(start: startDate)
		
		// THEN
		XCTAssertEqual(interval.start, startDate)
		XCTAssertNil(interval.end)
	}
	
	func testContains_ShouldReturnTrueForDateInRange() {
		// GIVEN
		let startDate = Date(timeIntervalSinceReferenceDate: 0)
		let endDate = Date(timeIntervalSinceReferenceDate: 2)
		let testDate = Date(timeIntervalSinceReferenceDate: 1)
		
		let interval = OpenDateInterval(start: startDate, end: endDate)
		
		// WHEN
		let result = interval.contains(testDate)
		
		// THEN
		XCTAssertTrue(result)
	}
	
	func testContains_ShouldReturnFalseForDatesOutsideOfRange() {
		// GIVEN
		let startDate = Date(timeIntervalSinceReferenceDate: 0)
		let endDate = Date(timeIntervalSinceReferenceDate: 2)
		
		let greaterDate = Date(timeIntervalSinceReferenceDate: 3)
		let lesserDate = Date(timeIntervalSinceReferenceDate: -1)
		
		let interval = OpenDateInterval(start: startDate, end: endDate)
		
		// WHEN
		let greaterResult = interval.contains(greaterDate)
		let lesserResult = interval.contains(lesserDate)
		
		// THEN
		XCTAssertFalse(greaterResult)
		XCTAssertFalse(lesserResult)
	}
	
	func testContains_ShouldReturnTrueForEdges() {
		// GIVEN
		let startDate = Date(timeIntervalSinceReferenceDate: 0)
		let endDate = Date(timeIntervalSinceReferenceDate: 2)
		
		let interval = OpenDateInterval(start: startDate, end: endDate)
		
		// WHEN
		let startResult = interval.contains(startDate)
		let endResult = interval.contains(endDate)
		
		// THEN
		XCTAssertTrue(startResult)
		XCTAssertTrue(endResult)
	}
	
	func testContains_InOpenEnded_ShouldReturnTrueForStartDateAndFalseForEverythingElse() {
		// GIVEN
		let startDate = Date(timeIntervalSinceReferenceDate: 0)
		
		let greaterDate = Date(timeIntervalSinceReferenceDate: 3)
		let lesserDate = Date(timeIntervalSinceReferenceDate: -1)
		
		let interval = OpenDateInterval(start: startDate)
		
		// WHEN
		let startDateResult = interval.contains(startDate)
		let greaterResult = interval.contains(greaterDate)
		let lesserResult = interval.contains(lesserDate)
		
		// THEN
		XCTAssertTrue(startDateResult)
		XCTAssertFalse(greaterResult)
		XCTAssertFalse(lesserResult)
	}
	
	func testIntersects_ShouldReturnTrueForOverlappingIntervals() {
		// GIVEN
		let interval1 = OpenDateInterval(start: Date(timeIntervalSinceReferenceDate: 0), end: Date(timeIntervalSinceReferenceDate: 2))
		let interval2 = OpenDateInterval(start: Date(timeIntervalSinceReferenceDate: 1), end: Date(timeIntervalSinceReferenceDate: 3))
		
		// WHEN
		let result = interval1.intersects(interval2)
		
		// THEN
		XCTAssertTrue(result)
	}
	
	func testIntersects_ShouldReturnFalseForNonOverlappingIntervals() {
		// GIVEN
		let interval1 = OpenDateInterval(start: Date(timeIntervalSinceReferenceDate: 0), end: Date(timeIntervalSinceReferenceDate: 2))
		let interval2 = OpenDateInterval(start: Date(timeIntervalSinceReferenceDate: 3), end: Date(timeIntervalSinceReferenceDate: 4))
		
		// WHEN
		let result = interval1.intersects(interval2)
		
		// THEN
		XCTAssertFalse(result)
	}
	
	func testIntersects_ShouldReturnTrueForClosedIntervalIntersectingOpenEnded() {
		// GIVEN
		let interval1 = OpenDateInterval(start: Date(timeIntervalSinceReferenceDate: 0), end: Date(timeIntervalSinceReferenceDate: 2))
		let interval2 = OpenDateInterval(start: Date(timeIntervalSinceReferenceDate: 1))
		
		// WHEN
		let result = interval1.intersects(interval2)
		
		// THEN
		XCTAssertTrue(result)
	}
	
	func testDuration() {
		// GIVEN
		let startDate = Date(timeIntervalSinceReferenceDate: 0)
		let endDate = Date(timeIntervalSinceReferenceDate: 2)
		
		let expectedDuration = endDate.timeIntervalSinceReferenceDate - startDate.timeIntervalSinceReferenceDate
		
		let interval = OpenDateInterval(start: startDate, end: endDate)
		
		// WHEN
		let duration = interval.duration
		
		// THEN
		XCTAssertEqual(duration, expectedDuration)
	}
	
	func testDuration_ShouldReturn0ForOpenEnded() {
		// GIVEN
		let startDate = Date(timeIntervalSinceReferenceDate: 0)
		
		let interval = OpenDateInterval(start: startDate)
		
		// WHEN
		let duration = interval.duration
		
		// THEN
		XCTAssertEqual(duration, 0)
	}
}
