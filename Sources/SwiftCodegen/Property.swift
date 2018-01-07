//===----------------------------------------------------------------------===//
// Property.swift
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

public class Property: Symbol {
	
	public var propertyType: DataType
	
	public var getAccessor: PropertyAccessor?
	
	public var setAccessor: PropertyAccessor?
	
	public var initializer: Expression?
	
	public init(name: String, propertyType: DataType?, getAccessor: PropertyAccessor?, setAccessor: PropertyAccessor?, sourceReference: SourceReference? = nil, comment: Comment? = nil) {
		super.init(name, sourceReference, comment);
		self.propertyType = propertyType;
		self.getAccessor = getAccessor;
		self.setAccessor = setAccessor;
	}
	
	public override func accept(visitor: CodeVisitor) {
		visitor.visitProperty(property: self)
	}
	
	public override func acceptChildren(visitor: CodeVisitor) {
		
		propertyType.accept(visitor: visitor)
		
		if getAccessor != nil {
			getAccessor.accept(visitor: visitor)
		}

		if setAccessor != nil {
			setAccessor.accept(visitor: visitor)
		}

		if initializer != nil {
			initializer.accept(visitor: visitor)
		}
	}
}