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
	
	public var propertyType: DataType?
	
	public var getAccessor: PropertyAccessor?
	
	public var setAccessor: PropertyAccessor?
	
	public var initializer: Expression?
	
	public var `lazy` = false
	
	public var `static` = false
	
	public init(name: String, propertyType: DataType?, getAccessor: PropertyAccessor?, setAccessor: PropertyAccessor?, sourceReference: SourceReference? = nil, comment: Comment? = nil) {
		self.propertyType = propertyType;
		super.init(name: name, sourceReference: sourceReference, comment: comment);
		self.getAccessor = getAccessor;
		self.setAccessor = setAccessor;
	}
	
	public override func accept(visitor: CodeVisitor) {
		visitor.visitProperty(self)
	}
	
	public override func acceptChildren(visitor: CodeVisitor) {
		
		propertyType?.accept(visitor: visitor)
		
		getAccessor?.accept(visitor: visitor)
		
		setAccessor?.accept(visitor: visitor)

		initializer?.accept(visitor: visitor)
	}
}