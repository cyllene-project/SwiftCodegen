//===----------------------------------------------------------------------===//
// PropertyAccessor.swift
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

public class PropertyAccessor : Subroutine {

	public var property: Property?
	
	public var valueType: DataType?
	
	public var readable: Bool
	
	public var writable: Bool
	
	public var automatic: Bool = true
	
	public init(readable: Bool, writable: Bool, valueType: DataType?, body: Block?, sourceReference: SourceReference?, comment: Comment? = nil) {
		self.readable = readable
		self.writable = writable
		self.valueType = valueType
		super.init(name: nil, sourceReference: sourceReference, comment: comment)
		self.access = .public
	}
	
	public override func accept(visitor: CodeVisitor) {
		//visitor.visitPropertyAccessory(self)
	}

	public override func acceptChildren(visitor: CodeVisitor) {
		
		valueType?.accept(visitor: visitor)
		
		body?.accept(visitor: visitor)

	}

}