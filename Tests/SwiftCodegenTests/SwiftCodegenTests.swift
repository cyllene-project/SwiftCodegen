import XCTest
@testable import SwiftCodegen

class SwiftCodegenTests: XCTestCase {
	
	func testConstant() {
		
		let result = "let maximumNumberOfLoginAttempts = 10\n"

		let writer = TestWriter()
		
		let const = Constant(let: "maximumNumberOfLoginAttempts", equals: 10)
		
		const.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")
		
	}
	
	func testVar() {
		
		let result = "var currentLoginAttempt = 0\n"

		let writer = TestWriter()
		
		let variable = Variable(var: "currentLoginAttempt", equals: 0)

		vairable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")
		
		
	}
	
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
