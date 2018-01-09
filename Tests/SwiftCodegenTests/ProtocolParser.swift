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
		var SourceFile: SourceFile?
	}

	var context: CodeContext?
	var sourceFile: SourceFile?

	var server = ProtocolPackage()
	var client = ProtocolPackage()
	
	func parse(context: CodeContext) {
		self.context = context
		context.accept(visitor: self)
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
		
		switch elementName {	
		case "protocol":
			server.package = Package(name: attributeDict["name"]!.capitalizingFirstLetter())
			server.sourceFile = SourceFile(context: context!, server.package.name + "Server.swift")
			client.package = Package(name: attributeDict["name"]!.capitalizingFirstLetter())
			client.sourceFile = SourceFile(context: context!, client.package.name + "Client.swift")
		case "copyright", "description" :
			return
			//currentPackage?.comment = Comment()
		case "interface":
			currentSymbol = Protocol(name: attributeDict["name"]!)		
		case "request":
			let meth = Method(name: attributeDict["name"]!)
			let proto = currentSymbol as! Protocol? 
			proto?.methods.append(meth)
			currentSymbol = meth
		case "arg":
			return
		case "event":
			currentSymbol = Method(name: attributeDict["name"]!)
		case "enum":
			currentSymbol = Enum(name: currentSymbol!.name! + attributeDict["name"]!)
		case "entry":
			return
		default:
			return
		}
		
		if currentSymbol != nil {
			sourceFile!.nodes.append(currentSymbol!)
		}
	}
	
	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
	}
	
	func parser(_ parser: XMLParser, foundCharacters string: String) {
		if currentSymbol?.comment != nil {
			currentSymbol!.comment?.content += string.trimmingCharacters(in: .whitespacesAndNewlines)
			return
		}
		currentSymbol?.comment = Comment(comment: string)
	}

	func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
		print(parseError)
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