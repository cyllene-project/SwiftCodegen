//===----------------------------------------------------------------------===//
// Parameter.swift
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

public class Parameter : Variable {

	public var label: ArgumentLabel?

	public var ellipsis: Bool = false
	
	public var captured: Bool = false
	
	public var omitName: Bool = false
	
	public var isInout: Bool = false
	
	public init(name: String, variableType: DataType?, label: ArgumentLabel? = nil, sourceReference: SourceReference? = nil) {
		self.label = label
		super.init(variableType: variableType, name: name, initializer: nil, sourceReference: sourceReference)
		access = .public
	}

	public init(sourceReference: SourceReference? = nil) {
		ellipsis = true
		super.init(variableType: nil, name: nil, initializer: nil, sourceReference: sourceReference)
		access = .public
	}

	public override func accept(visitor: CodeVisitor) {
		visitor.visitParameter(self)
	}
	
	public override func acceptChildren(visitor: CodeVisitor) {
		
		if ellipsis != true {
			variableType?.accept(visitor: visitor)
			
			initializer?.accept(visitor: visitor)
			
		}
	}

}