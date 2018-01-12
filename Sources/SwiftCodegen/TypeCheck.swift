//===----------------------------------------------------------------------===//
// TypeCheck.swift
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

public class TypeCheck: Expression {
	
	public var expression: Expression
	
	public var typeReference: DataType
	
	public init(expression: Expression, type: DataType, sourceReference: SourceReference? = nil) {
		self.expression = expression
		self.typeReference = type
		super.init(sourceReference: sourceReference)
	}
	
	
	
}