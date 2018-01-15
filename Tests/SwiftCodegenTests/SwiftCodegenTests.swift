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
		let writer = TextWriter(context: context)
		context.accept(visitor: writer)

	}

	func testWayland() {
		
		let context = CodeContext()
		let bundle = Bundle(path: (".") + "/Tests/SwiftCodegenTests") ?? Bundle.main
		let path = bundle.path(forResource: "wayland", ofType: "xml")!
		context.add(filename: path)
		let parser = ProtocolParser()
		parser.parse(context: context)
		let writer = TextWriter(context: context)
		context.accept(visitor: writer)

	}


	static var allTests = [
		("testExample", testExample),
		("testWayland", testWayland),
	]
}
