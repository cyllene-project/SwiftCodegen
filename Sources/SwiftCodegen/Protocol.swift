//===----------------------------------------------------------------------===//
// Protocol.swift
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

public class Protocol: ObjectTypeSymbol {
	
	public var prerequisites: [DataType] = []
	
	public var methods: [Method] = []
	
	public var properties: [Property] = []
	

	public override func accept(visitor: CodeVisitor) {
		//visitor.visitProtocol(self)
	}
	
	public override func acceptChildren(visitor: CodeVisitor) {
		
		for type in prerequisites {
			type.accept(visitor: visitor)
		}
		
		for method in methods {
			method.accept(visitor: visitor)
		}
		
		for property in properties {
			property.accept(visitor: visitor)
		}
	}
	
	public override func emit<T: CodeWriter>(writer: T) {
		comment?.emit(writer: writer)
		writer.writeIndent()
		//writer.writeAccessibility(prtcl.access)
		writer.writeString("protocol \(name!)")
		
		writer.writeString(prerequisites.isEmpty ? "" : ",")
		if !prerequisites.isEmpty {
			writer.writeString(" : ")
		}
		writer.writeString(prerequisites.map { t in t.dataType!.name! }.joined(separator:", "))
		writer.writeBeginBlock()
				
		for prop in properties {
			prop.emit(writer: writer)
		}
		
		for meth in methods {
			meth.emit(writer: writer)
		}
				
		writer.writeEndBlock()
		writer.writeNewline()
	}
}