//===----------------------------------------------------------------------===//
// TestWriter.swift
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

class TestWriter: CodeWriter {
	
	var content: String
	
	var newLine: String
	
	var indentString: String
	
	var bol = true
	
	var indent = 0
	
	init() {
		content = ""
		newLine = "\n"
		indentString = "\t"
	}
	
	public func visit<T: CodeNode>(_ node: T) {		
		node.emit(writer: self)
	}

	public func visitSourceFile(_ file: SourceFile) {
		writeFile(file: file, fileName: file.filename)
	}
	
	func writeFile(file: SourceFile, fileName: String) {
		
	}
	
	public func writeString(_ string: String) {
		content += string
		bol = false
	}

	public func writeNewline() {
		content += "\n"
		bol = true
	}
	
	public func writeBeginBlock() {
		if !bol {
			writeString(" ")
		} else {
			writeIndent()
		}
		writeString("{")
		writeNewline()
		indent += 1
	}
	
	public func writeEndBlock() {
		indent -= 1
		writeIndent()
		writeString("}")
		writeNewline()
	}

	public func writeIndent() {
		if !bol {
			writeNewline()
		}
		
		for _ in 0..<indent {
			writeString(indentString)
		}
		
		bol = false
	}
	
}