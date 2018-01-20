//===----------------------------------------------------------------------===//
// WhileStatement.swift
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

public class WhileStatement: CodeNode {
	
	public var condition: Expression
	
	public var body: Block?
	
	public var repeatBody: Block?
	
	public init(condition: Expression, body: Block? = nil, repeatBody: Block? = nil, sourceReference: SourceReference? = nil) {
		self.condition = condition
		self.body = body
		self.repeatBody = repeatBody
		super.init(sourceReference: sourceReference)
	}
	
	public override func accept<T: CodeWriter>(visitor: T) {
		visitor.writeIndent()
		repeatBody?.accept(visitor: visitor)
		visitor.writeString("while ")
		condition.accept(visitor: visitor)
		body?.accept(visitor: visitor)
	}

}