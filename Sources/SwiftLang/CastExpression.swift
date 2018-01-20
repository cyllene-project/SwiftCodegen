//===----------------------------------------------------------------------===//
// CastExpression.swift
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

public class CastExpression: Expression {
	
	public var inner: Expression
	
	public var typeReference: DataType
	
	public var force = false
	
	public var unwrap = false
	
	public init(inner: Expression, typeReference: DataType, force: Bool = false, sourceReference: SourceReference? = nil) {
		self.inner = inner 
		self.typeReference = typeReference
		self.force = force
		super.init(sourceReference: sourceReference)
		
	}
	
	
}