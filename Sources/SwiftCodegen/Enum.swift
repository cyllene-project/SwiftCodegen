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
	
	public override func accept(visitor: CodeVisitor) {
		//visitor.visitEnum(self)
	}

	public override func acceptChildren(visitor: CodeVisitor) {
		
		for type in baseTypes {
			type.accept(visitor: visitor)
		}
		
		for method in methods {
			method.accept(visitor: visitor)
		}
	}

	
	public override func emit<T: CodeWriter>(writer: T) {
		comment?.emit(writer: writer)
		writer.writeIndent()
		//writer.writeAccessibility(enm.access)
		writer.writeString("enum \(name!)")
		
		writer.writeBeginBlock()
		
		for value in values {
			value.emit(writer: writer)
		}
		
		for prop in properties {
			prop.emit(writer: writer)
		}
		
		for meth in methods {
			meth.emit(writer: writer)
		}
		
		writer.writeEndBlock()
	}
	
}