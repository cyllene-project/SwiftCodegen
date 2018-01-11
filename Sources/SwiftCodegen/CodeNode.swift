//===----------------------------------------------------------------------===//
// CodeNode.swift
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

public class CodeNode {
	
	public weak var parentNode: CodeNode?
	
	public var sourceReference: SourceReference?
	
	public var attributes: [Attribute] = []
	
	public init() { }
	
	public func accept(visitor: CodeVisitor) { }
	
	public func acceptChildren(visitor: CodeVisitor) { }
			
	public func emit<T>(writer: T) {	}

}

public extension CodeNode {
	

}