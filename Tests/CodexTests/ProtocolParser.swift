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

class ProtocolParser: CodeVisitor, XMLParserDelegate {
	

	struct ProtocolPackage {
		var package: Package?
		var currentSymbol: Symbol?
		var currentClass: Class?
		var currentProtocol: Protocol?
		var currentMethod: Method?
		var currentEnum: Enum?
		var sourceFile: SourceFile?
	}

	var context: CodeContext?
	var sourceFile: SourceFile?

	var server = ProtocolPackage()
	var client = ProtocolPackage()
	
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
	
	func createPackage(name: String) {
		server.package = Package(name: name)
		server.sourceFile = SourceFile(context: context!, filename: server.package!.name! + "Server.swift")
		server.currentSymbol = server.package
		client.package = Package(name: name)
		client.sourceFile = SourceFile(context: context!, filename: client.package!.name! + "Client.swift")
		client.currentSymbol = client.package
	}

	func createProtocol(name: String) {
		server.currentProtocol = Protocol(name: name)
		server.currentSymbol = server.currentProtocol
		server.package?.protocols.append(server.currentProtocol!)
		client.currentProtocol = Protocol(name: name)
		client.currentSymbol = client.currentProtocol
		client.package?.protocols.append(client.currentProtocol!)
	}
	
	func createRequest(name: String) {
		client.currentMethod = Method(name: name)
		client.currentSymbol = client.currentMethod
		client.currentProtocol?.methods.append(client.currentMethod!)
	}

	func createEvent(name: String) {
		server.currentMethod = Method(name: name)
		server.currentSymbol = client.currentMethod
		server.currentProtocol?.methods.append(client.currentMethod!)
	}
	
	func createComment() {
		server.currentSymbol!.comment = Comment(comment: "")
		client.currentSymbol!.comment = Comment(comment: "")
	}
	
	func createEnum(name: String) {
		server.currentEnum = Enum(name: name)
		server.currentSymbol = server.currentEnum
		server.package?.enums.append(server.currentEnum!)
		client.currentEnum = Enum(name: name)
		client.currentSymbol = client.currentEnum
		client.package?.enums.append(client.currentEnum!)
	}
	
	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
		
		switch elementName {
		case "protocol":
			createPackage(name: attributeDict["name"]!.capitalizingFirstLetter())
		case "copyright", "description" :
			createComment()
		case "interface":
			createProtocol(name: attributeDict["name"]!)		
		case "request":
			createRequest(name: attributeDict["name"]!)
		case "arg":
			return
		case "event":
			createEvent(name: attributeDict["name"]!)
		case "enum":
			createEnum(name: attributeDict["name"]!)
		case "entry":
			return
		default:
			return
		}
	}
	
	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {

	}
	
	func parser(_ parser: XMLParser, foundCharacters string: String) {
		server.currentSymbol!.comment?.content += string.trimmingCharacters(in: .whitespacesAndNewlines)
		client.currentSymbol!.comment?.content += string.trimmingCharacters(in: .whitespacesAndNewlines)
	}

	func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {

	}

}

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}