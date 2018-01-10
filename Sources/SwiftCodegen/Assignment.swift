//===----------------------------------------------------------------------===//
// Assignment.swift
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

public class Assignment: Expression {
	
	public var `left`: Expression
	
	public var `operator`: AssignmentOperator
	
	public var `right`: Expression

	public init(`left`: Expression, `right`: Expression, `operator`: AssignmentOperator = .simple, sourceReference: SourceReference? = nil) {
		self.`left` = `left`
		self.`operator` = `operator`
		self.`right` = `right`
		self.sourceReference = sourceReference
	}
	
	public override func accept(visitor: CodeVisitor) {
		visitor.visitAssignment(self)
		visitor.visitExpression(self)
	}
	
	public override func acceptChildren(visitor: CodeVisitor) {
		`left`.accept(visitor: visitor)
		`right`.accept(visitor: visitor)
	}
}