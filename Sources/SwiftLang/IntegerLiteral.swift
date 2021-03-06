//===----------------------------------------------------------------------===//
// IntegerLiteral.swift
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

public class IntegerLiteral: Literal {
	
	public var value: String
	
	public var typeSuffix: String?
	
	public init(value: String, sourceReference: SourceReference? = nil) {
		self.value = value
		super.init(sourceReference: sourceReference)
	}
	
	public override func accept<T: CodeWriter>(visitor: T) {
		visitor.writeString(value)
	}

}