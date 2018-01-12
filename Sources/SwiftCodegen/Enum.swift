//===----------------------------------------------------------------------===//
// Enum.swift
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

public class Enum: TypeSymbol {
	
	var baseTypes: [DataType] = []
	var methods: [Method] = []
	var values: [EnumValue] = []
	var properties: [Property] = []

	
	public override func accept<T: CodeWriter>(visitor: T) {
		comment?.accept(visitor: visitor)
		visitor.writeIndent()
		access.accept(visitor: visitor)
		visitor.writeString("enum \(name!)")
		
		visitor.writeBeginBlock()
		
		for value in values {
			value.accept(visitor: visitor)
		}
		
		for prop in properties {
			prop.accept(visitor: visitor)
		}
		
		for meth in methods {
			meth.accept(visitor: visitor)
		}
		
		visitor.writeEndBlock()
	}
	
}