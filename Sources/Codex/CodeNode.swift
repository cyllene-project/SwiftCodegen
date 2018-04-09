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

public protocol CodeNode {
	
	var parentNode: CodeNode? { get set }
	
	var sourceReference: SourceReference? { get set }
	
	func accept<T>(visitor: T)
	
}

public extension CodeNode {
	public func accept<T>(visitor: T) { }
}