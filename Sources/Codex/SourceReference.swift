//===----------------------------------------------------------------------===//
// SourceReference.swift
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

public struct SourceReference {
	
	public var file: SourceFile?
	
	public var begin: SourceLocation
	
	public var end: SourceLocation
	
	public init(file: SourceFile, begin: SourceLocation, end: SourceLocation) {
		self.file = file
		self.begin = begin
		self.end = end
	}	
}