//===----------------------------------------------------------------------===//
// CodeVisitor.swift
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

public protocol CodeVisitor {
	
	func visitAssignment(_ assign: Assignment)
	
	func visitClass(_ cls: Class)
	
	func visitEnum(_ enm: Enum)
	
	func visitExpression(_ expr: Expression)
		
	func visitProtocol(_ prtcl: Protocol)
	
	func visitStruct(_ strct: Struct) 

	func visitImportDirective(_ directive: ImportDirective) 

	func visitConstructor(_ constructor: Constructor) 
	
	func visitDestructor(_ destructor: Destructor) 

	func visitPackage(_ package: Package) 
	
	func visitParameter(_ param: Parameter) 
	
	func visitProperty(_ prop: Property) 

	func visitPropertyAccessory(_ accessor: PropertyAccessor) 

	func visitTypeParameter(_ param: TypeParameter) 

	func visitSourceFile(_ file: SourceFile)

	func visitMethod(_ method: Method)

	func visitEnumValue(_ value: EnumValue)
	
}

public extension CodeVisitor {

	func visitAssignment(_ assign: Assignment) { }
	
	func visitClass(_ cls: Class) { }

	func visitEnum(_ enm: Enum) { }
	
	func visitExpression(_ expr: Expression) { }

	func visitProtocol(_ prtcl: Protocol) { }

	func visitStruct(_ strct: Struct) { }

	func visitImportDirective(_ directive: ImportDirective) { }

	func visitConstructor(_ constructor: Constructor) { }

	func visitDestructor(_ destructor: Destructor) { }

	func visitPackage(_ package: Package) { }
	
	func visitParameter(_ param: Parameter) { }

	func visitProperty(_ prop: Property) { }

	func visitPropertyAccessory(_ accessor: PropertyAccessor) { }

	func visitTypeParameter(_ param: TypeParameter) { }

	func visitSourceFile(_ file: SourceFile) { }

	func visitMethod(_ method: Method) { }

	func visitEnumValue(_ value: EnumValue)	{ }
}