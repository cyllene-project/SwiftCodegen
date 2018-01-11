//===----------------------------------------------------------------------===//
// Subscript.swift
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

public class Subscript: Subroutine {
	
	public var returnType: DataType
	
	public var hasResult: Bool {
		get {
			return !(returnType is VoidType)
		}
	}
	
	public var isAbstract = false
		
	public var overrides: Bool = false
		
	public var `mutating` = false
			
	var parameters: [Parameter] = []
	
	public init(name: String?, returnType: DataType? = nil, sourceReference: SourceReference? = nil, comment: Comment? = nil) {
		self.returnType = returnType ?? VoidType();
		super.init(name: name, sourceReference: sourceReference, comment: comment);
	}
	
	
}