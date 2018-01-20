//===----------------------------------------------------------------------===//
// Expression.swift
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

public protocol Expression : CodeNode {

	var valueType: DataType? { get set }
	
	var targetType: DataType? { get set }
	
	weak var symbolReference: Symbol? { get set }
	
	var lvalue: Bool { get set }
	
	var targetValue: TargetValue?  { get set }

}