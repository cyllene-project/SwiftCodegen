import XCTest
@testable import SwiftCodegen

class SwiftCodegenTests: XCTestCase {
	
	func testConstant() {
		
		let result = "let maximumNumberOfLoginAttempts = 10\n"

		let writer = TestWriter()
		
		let const = Constant(name: "maximumNumberOfLoginAttempts", value: 10)
		
		const.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")
	}
	
	func testVar() {
		
		let result = "var currentLoginAttempt = 0\n"

		let writer = TestWriter()
		
		let variable = Variable(name: "currentLoginAttempt", value: 0)

		vairable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	
	func testMultiVar() {
		
		let result = "var x = 0.0, y = 0.0, z = 0.0\n"

		let writer = TestWriter()
		
		let variable = Variable(name: "x", value: 0.0)

		vairable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	
	func testVarWithType() {
		
		let result = "var welcomeMessage: String\n"

		let writer = TestWriter()
		
		let variable = Variable(name: "welcomeMessage")

		vairable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	
	func testVarAssignment() {
		
		let result = "welcomeMessage = \"Hello\"\n"

		let writer = TestWriter()
		
		let variable = Variable(name: "welcomeMessage")

		vairable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	
	func testMultiVarWithType() {
		
		let result = "var red, green, blue: Double\n"

		let writer = TestWriter()
		
		let variable = Variable(name: "red")

		vairable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	
	func testUnicodeNames() {
		
		let result = """
		let π = 3.14159
		let 你好 = \"你好世界\"
		let �� = \"dogcow\"
		"""

		let writer = TestWriter()
		
		let variable = Variable(name: "red")

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
