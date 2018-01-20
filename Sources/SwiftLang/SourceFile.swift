//===----------------------------------------------------------------------===//
// SourceFile.swift
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

import Foundation

public class SourceFile {
	
	public var filename: String
	
	public weak var context: CodeContext?
	
	public var comments: [Comment] = []
	
	public var currentImportDirectives: [ImportDirective] = []
	
	public var nodes: [CodeNode] = []
	
	public var content = ""
	
	public init (context: CodeContext, filename: String) {
		self.context = context
		self.filename = filename
	}
	
	public func write(toFile: String? = nil) throws {
		
		if toFile != nil {
			try content.write(to: URL(fileURLWithPath: toFile!), atomically: true, encoding: String.Encoding.utf8)
		} else {
			try content.write(to: URL(fileURLWithPath: filename), atomically: true, encoding: String.Encoding.utf8)
		}		
	}
	
	public func accept(visitor: CodeVisitor) {
		visitor.visitSourceFile(self)
	}

	public func acceptChildren(visitor: CodeVisitor) {
		for node in nodes {
			node.accept(visitor: visitor)
		}
	}
	
}