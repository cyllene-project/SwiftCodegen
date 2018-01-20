//===----------------------------------------------------------------------===//
// Variable.swift
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

public class Variable : Symbol {

	public var initializer: Expression?
	
	public var variableType: DataType?
	
	public init(variableType:DataType?, name: String?, initializer: Expression? = nil, sourceReference: SourceReference? = nil, comment: Comment? = nil) {
		super.init(name: name, sourceReference: sourceReference, comment: comment)
		self.variableType = variableType
		self.initializer = initializer
	}


}