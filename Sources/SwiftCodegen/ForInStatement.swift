//===----------------------------------------------------------------------===//
// ForInStatement.swift
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

public class ForInStatement: Block {
	
	public var typeReference: DataType?
	
	public var variableName: String
	
	public var collection: Expression
	
	public var body: Block
	
	public init(typeReference: DataType?, variableName: String, collection: Expression, body: Block, sourceReference: SourceReference? = nil) {
		self.typeReference = typeReference
		self.variableName = variableName		
		self.collection = collection		
		self.body = body
		super.init()
	}
	
	
}