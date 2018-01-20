//===----------------------------------------------------------------------===//
// Constructor.swift
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

public class Constructor: Subroutine {
	
	public var `convenience` = false
	
	public var `required` = false
	
	public var `override` = false
		
	public override func accept<T: CodeWriter>(visitor: T) {
		comment?.accept(visitor: visitor)
		visitor.writeIndent()
		access.accept(visitor: visitor)
		visitor.writeString("init")
		visitor.writeBeginBlock()
		visitor.writeEndBlock()
		visitor.writeNewline()
	}
}