//===----------------------------------------------------------------------===//
// Destructor.swift
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

public class Destructor: Subroutine {
	
	public override func accept(visitor: CodeVisitor) {
		//visitor.visitDestructor(self)
	}
	
	public override func emit<T: CodeWriter>(writer: T) {
		comment?.accept(visitor: writer)
		writer.writeIndent()
		
		//writer.writeAccessibility(constructor.access)
		writer.writeString("deinit")
		writer.writeBeginBlock()
		writer.writeEndBlock()
		writer.writeNewline()
	}
}