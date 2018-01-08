//===----------------------------------------------------------------------===//
//
// This source file is part of the Cyllene open source project
//
// Copyright (c) 2017 Chris Daley
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information
//
//===----------------------------------------------------------------------===//

import Foundation

public class CodeWriter : CodeVisitor {

	var context: CodeContext
	
	var indent: Int = 0
	
	var bol: Bool = true
	
	var tab: String = "\t"

	var sourceFile: SourceFile? 
	
	public init(context: CodeContext) {
		self.context = context
	}


	public func writeFile(file: SourceFile, fileName: String) throws {

		
		let fileManager = FileManager.default
		var tempFileName = fileName
		let fileExists = fileManager.fileExists(atPath: fileName)
		
		if  fileExists {
			tempFileName = fileName + ".swifttmp"
		}
		
		writeString("// Generated by SwiftCodegen")
		writeNewline()
		writeNewline()
		
		self.context = context
			
		self.context.accept(visitor: self)
		
		if fileExists {
			if fileManager.contentsEqual(atPath: fileName, andPath: tempFileName) {
				try fileManager.removeItem(atPath: tempFileName)
			} else {
				try fileManager.removeItem(atPath: fileName)
				try fileManager.moveItem(atPath: tempFileName, toPath: fileName)
			}
		}		

	}

	public func writeString(_ string: String) {
		sourceFile?.content += string
		bol = false
	}

	public func writeNewline() {
		sourceFile?.content += "\n"
		bol = true
	}
	
		func writeBeginBlock() {
		if !bol {
			writeString(" ")
		} else {
			writeIndent()
		}
		writeString("{")
		writeNewline()
		indent += 1
	}
	
	func writeEndBlock() {
		indent -= 1
		writeIndent()
		writeString("}")
	}

	func writeIndent() {
		if !bol {
			writeNewline()
		}
		
		for _ in 0..<indent {
			writeString(tab)
		}
		
		bol = false
	}
	
	func writeComment(comment: Comment?) {
		if comment == nil {
			return
		}
		writeIndent()
		writeString("/*")
		writeString(comment!.content)
		writeString("*/")
	}
	
	func writeAccessibility(_ access: SymbolAccessibility) {
		if access == .public {
			return
		}
		writeString("\(access) ")
	}
	
	public func visitClass(_ cls: Class) {
		
		writeComment(comment: cls.comment)
		writeIndent()
		writeAccessibility(cls.access)
		writeString("class \(cls.name!)")
		
		if cls.baseClass != nil {
			writeString(" : \(cls.baseClass!.name!)")
			writeString(cls.baseTypes.isEmpty ? "" : ",")
		} else if !cls.baseTypes.isEmpty {
			writeString(" : ")
		}
		writeString(cls.baseTypes.map { t in t.dataType!.name! }.joined(separator:", "))
		writeBeginBlock()
		
		for kls in cls.classes {
			visitClass(kls)
		}
		
		for strct in cls.structs {
			visitStruct(strct)
		}
		
		for prop in cls.properties {
			visitProperty(prop)
		}
		
		for meth in cls.methods {
			visitMethod(meth)
		}
		
		for enm in cls.enums {
			visitEnum(enm)
		}
		
		writeEndBlock()
		writeNewline()
	}
		
	public func visitEnum(_ enm: Enum) {
		writeComment(comment: enm.comment)
		writeIndent()
		writeAccessibility(enm.access)
		writeString("enum \(enm.name!)")
		
		writeBeginBlock()
		
		for value in enm.values {
			visitEnumValue(value)
		}
		
		for prop in enm.properties {
			visitProperty(prop)
		}
		
		for meth in enm.methods {
			visitMethod(meth)
		}
		
		writeEndBlock()
	}
	
	public func visitEnumValue(_ value: EnumValue) {
		writeIndent()
		writeString("case \(value.name!)")
		writeNewline()
	}
	
	public func visitProtocol(_ prtcl: Protocol) {
		writeComment(comment: prtcl.comment)
		writeIndent()
		writeAccessibility(prtcl.access)
		writeString("protocol \(prtcl.name!)")
		
		writeString(prtcl.prerequisites.isEmpty ? "" : ",")
		if !prtcl.prerequisites.isEmpty {
			writeString(" : ")
		}
		writeString(prtcl.prerequisites.map { t in t.dataType!.name! }.joined(separator:", "))
		writeBeginBlock()
				
		for prop in prtcl.properties {
			visitProperty(prop)
		}
		
		for meth in prtcl.methods {
			visitMethod(meth)
		}
				
		writeEndBlock()
		writeNewline()		
	}
	
	public func visitStruct(_ strct: Struct) {
		writeComment(comment: strct.comment)
		writeIndent()
		writeAccessibility(strct.access)
		writeString("struct \(strct.name!)")
		
		if !strct.baseTypes.isEmpty {
			writeString(" : ")
		}
		writeString(strct.baseTypes.map { t in t.dataType!.name! }.joined(separator:", "))
		writeBeginBlock()
		
		for strct in strct.structs {
			visitStruct(strct)
		}
		
		for prop in strct.properties {
			visitProperty(prop)
		}
		
		for meth in strct.methods {
			visitMethod(meth)
		}
		
		for enm in strct.enums {
			visitEnum(enm)
		}
		
		writeEndBlock()
		writeNewline()
		
	}

	public func visitImportDirective(_ directive: ImportDirective) {
		writeIndent()
		writeString("import \(directive.name!)")
		writeNewline()
	}

	public func visitConstructor(_ constructor: Constructor) {
		writeComment(comment: constructor.comment)
		writeIndent()
		writeAccessibility(constructor.access)
		writeString("init")
		writeBeginBlock()
		writeEndBlock()
		writeNewline()	

	}
	
	public func visitDestructor(_ destructor: Destructor) {
		writeIndent()
		writeString("deinit ")
		writeBeginBlock()
		writeEndBlock()
		writeNewline()	
	}
	
	public func visitMethod(_ method: Method) {

	}

	public func visitPackage(_ package: Package) {
		if package.name == nil {
			package.acceptChildren(visitor: self)
			return
		}
		
		for comment in package.comments {
			writeComment(comment: comment)
		}
		
		for cls in package.classes {
			cls.accept(visitor: self)
		} 
		
		for proto in package.protocols {
			proto.accept(visitor: self)
		} 
	}
	
	public func visitParameter(_ param: Parameter) {
		
	}
	
	public func visitProperty(_ prop: Property) {
		
	}

	public func visitPropertyAccessory(_ accessor: PropertyAccessor) {
		
	}

	public func visitTypeParameter(_ param: TypeParameter) {
		
	}

	public func visitSourceFile(_ file: SourceFile) {

	}
}

enum CodeWriterError : Error {
	
	
}
