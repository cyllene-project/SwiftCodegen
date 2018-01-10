//===----------------------------------------------------------------------===//
// BinaryOperator.swift
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

public enum BinaryOperator {
	case `none`
	case plus
	case minus
	case mul
	case div
	case mod
	case shiftLeft
	case shiftRight
	case lessThan
	case greaterThan
	case lessThanOrEqual
	case greaterThanOrEqual
	case equality
	case inequality
	case bitwiseAnd
	case bitwiseOr
	case bitwiseXor
	case and
	case or
	case `in`
	case coalesce
}