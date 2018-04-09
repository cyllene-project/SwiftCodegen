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

import Codex

/**
  A local constant (let) declaration
 */
public class Constant: Symbol {

	// CodeNode protocol

	public weak var parentNode: CodeNode?
	
	public var sourceReference: SourceReference?
		
	// Symbol protocol
	
	public var name: String?
	
	public var deprecated: Bool = false
	
	public var access: SymbolAccessibility = .internal
	
	public var typeReference: DataType?
	
	public var comment: Comment?

	// Constant implementation

	public var value: Expression?
	
	public init(name: String, typeReference: DataType? = nil, value: Expression? = nil, sourceReference: SourceReference? = nil, comment: Comment? = nil) {
		self.typeReference = typeReference
		self.value = value
		self.name = name
		self.sourceReference = sourceReference
		self.comment = comment
	}
	
	public convenience init<T: SignedInteger>(name: String, value: T, sourceReference: SourceReference? = nil, comment: Comment? = nil) {
		
		//self.init(name: name,
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