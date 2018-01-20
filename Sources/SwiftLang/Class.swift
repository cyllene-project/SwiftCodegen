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

	public override func accept<T: CodeWriter>(visitor: T) {
		
		comment?.accept(visitor: visitor)
		visitor.writeIndent()
		access.accept(visitor: visitor)
		visitor.writeString("class \(name!)")
		
		if baseClass != nil {
			visitor.writeString(" : \(baseClass!.name!)")
			visitor.writeString(baseTypes.isEmpty ? "" : ",")
		} else if !baseTypes.isEmpty {
			visitor.writeString(" : ")
		}
		visitor.writeString(baseTypes.map { t in t.dataType!.name! }.joined(separator:", "))
		visitor.writeBeginBlock()
		
		for cls in classes {
			cls.accept(visitor: visitor)
		}
		
		for strct in structs {
			strct.accept(visitor: visitor)
		}
		
		for prop in properties {
			prop.accept(visitor: visitor)
		}
		
		for meth in methods {
			meth.accept(visitor: visitor)
		}
		
		for enm in enums {
			enm.accept(visitor: visitor)
		}
		
		visitor.writeEndBlock()
		visitor.writeNewline()
	}

}

public extension Class {
	
}