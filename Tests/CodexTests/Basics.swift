//===----------------------------------------------------------------------===//
// Basics.swift
// 
// This source file is part of the Cyllene open source project
// https://github.com/cyllene-project
// 
// Copyright (c) 2018 Chris Daley <chebizarro@gmail.com>
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// 
// See http://www.apache.org/licenses/LICENSE-2.0 for license information
//
//===----------------------------------------------------------------------===//

import XCTest
@testable import SwiftCodegen

class BasicTests: XCTestCase {
	
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

		variable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	
	func testMultiVar() {
		
		let result = "var x = 0.0, y = 0.0, z = 0.0\n"

		let writer = TestWriter()
		
		let x = Variable(name: "x", value: 0.0)
		let y = Variable(name: "y", value: 0.0)
		let z = Variable(name: "z", value: 0.0)

		

		variable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	
	func testVarWithType() {
		
		let result = "var welcomeMessage: String\n"

		let writer = TestWriter()
		
		let variable = Variable(name: "welcomeMessage")

		variable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	
	func testVarAssignment() {
		
		let result = "welcomeMessage = \"Hello\"\n"

		let writer = TestWriter()
		
		let variable = Variable(name: "welcomeMessage")

		variable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	
	func testMultiVarWithType() {
		
		let result = "var red, green, blue: Double\n"

		let writer = TestWriter()
		
		let variable = Variable(name: "red")

		variable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	
	func testUnicodeNames() {
		
		let result = """
		let π = 3.14159
		let 你好 = "你好世界"
		let �� = "dogcow"
		"""

		let writer = TestWriter()
		
		let variable = Variable(name: "red")

		variable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	
	func testVarChange() {
		
		let result = """
		var friendlyWelcome = "Hello!"
		friendlyWelcome = "Bonjour!"
		// friendlyWelcome is now "Bonjour!
		"""

		let writer = TestWriter()
		
		let variable = Variable(name: "friendlyWelcome", value: "Hello!")

		variable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	
	func testPrintInterpolation() {
		
		let result = """
		print("The current value of friendlyWelcome is \(friendlyWelcome)")
		// Prints "The current value of friendlyWelcome is Bonjour!"
		"""

		let writer = TestWriter()
		
		let variable = Variable(name: "friendlyWelcome", value: "Hello!")

		variable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	
	func testComment() {

		let result = "// This is a comment.\n"

		let writer = TestWriter()
		
		let variable = Variable(name: "friendlyWelcome", value: "Hello!")

		variable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")
	}

	func testMultilineComment() {
		
		let result = """
		/* This is also a comment
		 but is written over multiple lines. */
		"""

		let writer = TestWriter()
		
		let variable = Variable(name: "friendlyWelcome", value: "Hello!")

		variable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}

	func testNestedComments() {
		
		let result = """
		/* This is the start of the first multiline comment.
		 /* This is the second, nested multiline comment. */
		 This is the end of the first multiline comment. */
		"""

		let writer = TestWriter()
		
		let variable = Variable(name: "friendlyWelcome", value: "Hello!")

		variable.accept(visitor: writer)

		XCTAssertEqual(writer.content, result, "Output did not mach expected result")		
	}
	


	static var allTests = [
		("testConstant", testConstant),
		("testVar", testVar),
		("testMultiVar", testMultiVar),
		("testVarWithType", testVarWithType),
		("testVarAssignment", testVarAssignment),
		("testMultiVarWithType", testMultiVarWithType),
		("testUnicodeNames", testUnicodeNames),
		("testVarChange", testVarChange),
		("testPrintInterpolation", testPrintInterpolation),
		("testComment", testComment),
		("testMultilineComment", testMultilineComment),
		("testNestedComments", testNestedComments),
	]
}
