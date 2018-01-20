//===----------------------------------------------------------------------===//
// TestParser.swift
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

import SwiftCodegen
import Foundation

class TestParser: CodeVisitor, XMLParserDelegate {
	
	var context: CodeContext?
	var sourceFile: SourceFile?
	
	func parse(context: CodeContext) {
		self.context = context
		context.accept(visitor: self)
	}
	
	func visit<T: CodeNode>(_ node: T) {

	}

	public func visitSourceFile(_ file: SourceFile) {
		sourceFile = file
		parseFile(file: file)
	}
	
	func parseFile(file: SourceFile) {
		let url = URL(string: "file://\(file.filename)")
		let parser = XMLParser(contentsOf: url!)
		if parser == nil {
			print("parser failed to parse \(file.filename)")
		}
		parser?.delegate = self
		parser?.parse()
	}
	
	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
		
		if elementName == "class" {
			let name = attributeDict["name"]
			let cls = Class(name: name)
			sourceFile!.nodes.append(cls)
		}
		
	}
	
	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {

	}
	
	func parser(_ parser: XMLParser, foundCharacters string: String) {

	}

	func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
		print(parseError)
	}

}