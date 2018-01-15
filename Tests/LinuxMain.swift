import XCTest
@testable import SwiftCodegenTests

XCTMain([
    testCase(SwiftCodegenTests.allTests),
    testCase(BasicTests.allTests),
])
