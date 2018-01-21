//===----------------------------------------------------------------------===//
// Constant.swift
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

/**
  A local constant (let) declaration
 */

public class Constant: Symbol {

	public weak var parentNode: CodeNode? { get set }
	
	public var sourceReference: SourceReference? { get set }
		
	public var name: String?
	
	public var deprecated: Bool = false
	
	public var access: SymbolAccessibility = .internal
	
	public var typeReference: DataType?
	
	public var comment: Comment?

	
	public var value: Expression?
	
	public init(name: String, typeReference: DataType? = nil, value: Expression? = nil, sourceReference: SourceReference? = nil, comment: Comment? = nil) {
		self.typeReference = typeReference
		self.value = value
		super.init(name: name, sourceReference: sourceReference, comment: comment)
		self.access = .internal
	}
	
	public convenience init<T>(name: String, value: T, sourceReference: SourceReference? = nil, comment: Comment? = nil) {
		if value is SignedInteger {
			
		} else if value is UnsignedInteger {
			
		} else if value is 
		
		
	}
	
	public override func accept<T: CodeWriter>(visitor: T) {
		
		access.accept(visitor: visitor)
		visitor.writeString("let ")
		name?.accept(visitor: visitor)
		visitor.writeString(": ")
		
		if typeReference != nil {
			visitor.writeString(": ")
			typeReference?.accept(visitor: visitor)
		}
		
		if value != nil {
			visitor.writeString(" = ")
			value!.accept(visitor: visitor)
		}
		
	}
}