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
	
	var prerequisites: [DataType] = []
	
	var methods: [Method] = []
	var properties: [Property] = []
	
	
	public init (name: String, sourceReference: SourceReference? = nil, comment: Comment? = nil) {
		super.init(name, sourceReference, comment)
	} 

	public override func accept(visitor: CodeVisitor) {
		visitor.visitProtocol(property: self)
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
}