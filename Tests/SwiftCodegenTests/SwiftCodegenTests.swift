import XCTest
@testable import SwiftCodegen

class SwiftCodegenTests: XCTestCase {
	
	func testExample() {
		
		let context = CodeContext()
		let bundle = Bundle(path: (".") + "/Tests/SwiftCodegenTests") ?? Bundle.main
		let path = bundle.path(forResource: "test", ofType: "xml")!
		context.add(filename: path)
		let parser = TestParser()
		parser.parse(context: context)
		

	}


	static var allTests = [
		("testExample", testExample),
	]
}
