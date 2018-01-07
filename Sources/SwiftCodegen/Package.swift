//===----------------------------------------------------------------------===//
// Package.swift
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

public class Package : Symbol {

	var classes: [Class] = []
	var protocols: [Protocol] = []
	var methods: [Method] = []
	var structs: [Struct] = []
	var enums: [Enum] = []
	var comments: [Comment] = []
	var importDirectives: [ImportDirective] = []

	public init(name: String? = nil, sourceReference: SourceReference? = nil) {
		super.init(name: name, sourceReference: sourceReference)
		access = .public
	}

	public override func accept(visitor: CodeVisitor) {
		visitor.visitPackage(self)
	}
	
	public override func acceptChildren(visitor: CodeVisitor) {
		
		for method in methods {
			method.accept(visitor: visitor)
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
		
		for proto in protocols {
			proto.accept(visitor: visitor)
		}
		
	}


}