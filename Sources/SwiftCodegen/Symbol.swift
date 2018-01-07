//===----------------------------------------------------------------------===//
// Symbol.swift
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

public class Symbol : CodeNode {
	
	public weak var parentSymbol: Symbol?
	
	public var name: String?
	
	public var deprecated: Bool = false

	public var access: SymbolAccessibility
	
	public var comment: Comment?
	
	public var sourceType: SourceFileType {
		get {
			if sourceReference != nil {
				return sourceReference.file.fileType
			} else {
				return .none
			}
		}
	}
	
	public init (name: String, sourceReference: SourceReference? = nil, comment: Comment? = nil) {
		self.name = name
		self.sourceReference = sourceReference
		self.comment = comment
	}

	
}