//===----------------------------------------------------------------------===//
// Class.swift
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

public class Class : ObjectTypeSymbol {
	
	public var baseClass: Class?
	
	var baseTypes: [DataType] = []

	var methods: [Method] = []
	var properties: [Property] = []
	var classes: [Class] = []
	var structs: [Struct] = []
	var enums: [Enum] = []
	
	var constructors: [Constructor] = []
	
	var destructor: Destructor?

	public var `final` = false
	
	public override func accept(visitor: CodeVisitor) {
		//visitor.visitClass(self)
	}
	
	public override func acceptChildren(visitor: CodeVisitor) {
		
		for type in baseTypes {
			type.accept(visitor: visitor)
		}
		
		for method in methods {
			method.accept(visitor: visitor)
		}
		
		for property in properties {
			property.accept(visitor: visitor)
		}
		
		for cls in classes {
			cls.accept(visitor: visitor)
		}
		
		for strct in structs {
			strct.accept(visitor: visitor)
		}
		
		for enm in enums {
			enm.accept(visitor: visitor)
		}
		
		for constructor in constructors {
			constructor.accept(visitor: visitor)
		}
		
		destructor?.accept(visitor: visitor)
	}	

	public override func emit<T: CodeWriter>(writer: T) {
		
		comment?.emit(writer: writer)
		writer.writeIndent()
		//writer.writeAccessibility(access)
		writer.writeString("class \(name!)")
		
		if baseClass != nil {
			writer.writeString(" : \(baseClass!.name!)")
			writer.writeString(baseTypes.isEmpty ? "" : ",")
		} else if !baseTypes.isEmpty {
			writer.writeString(" : ")
		}
		writer.writeString(baseTypes.map { t in t.dataType!.name! }.joined(separator:", "))
		writer.writeBeginBlock()
		
		for cls in classes {
			cls.emit(writer: writer)
		}
		
		for strct in structs {
			strct.emit(writer: writer)
		}
		
		for prop in properties {
			prop.emit(writer: writer)
		}
		
		for meth in methods {
			meth.emit(writer: writer)
		}
		
		for enm in enums {
			enm.emit(writer: writer)
		}
		
		writer.writeEndBlock()
		writer.writeNewline()
	}

}

public extension Class {
	
}