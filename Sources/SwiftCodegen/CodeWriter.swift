//===----------------------------------------------------------------------===//
//
// This source file is part of the Cyllene open source project
//
// Copyright (c) 2017 Chris Daley
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information
//
//===----------------------------------------------------------------------===//

import Foundation

public protocol CodeWriter: CodeVisitor {
	
	var newLine: String { get set }
	
	var indentString: String { get set }
	
	func writeFile(file: SourceFile, fileName: String)
	
	func writeString(_ string: String)

	func writeNewline()

	func writeEndBlock()
	
	func writeIndent()
	
	func writeBeginBlock()
}