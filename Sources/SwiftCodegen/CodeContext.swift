//===----------------------------------------------------------------------===//
// CodeContext.swift
// 
// This source file is part of the Cyllene open source project
// https://github.com/cyllene-project
// 
// Copyright (c) 2017 Chris Daley <chebizarro@gmail.com>
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// 
// See http://www.apache.org/licenses/LICENSE-2.0 for license information
//
//===----------------------------------------------------------------------===//

public class CodeContext {
		
	var root = Package()
	
	public var sourceFiles: [SourceFile] = []  
	
	func accept(visitor: CodeVisitor) {
		
		root.accept(visitor: visitor)
		
		for file in sourceFiles {
			file.accept(visitor: visitor)
		}

		
	}
	
	
}
