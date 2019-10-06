//
//  CalculatorKataTests.swift
//  CalculatorKataTests
//
//  Created by Alexander Spirichev on 17.09.2019.
//  Copyright © 2019 Alexander Spirichev. All rights reserved.
//

import XCTest
@testable import CalculatorKata

class StringCalculatorTests: XCTestCase {
    
    let sut = StringCalculator()

    func test_whenNumbersStringIsEmpty_returnZero() throws {
        let numbers = ""

        let result = try self.sut.add(numbers)

        XCTAssertEqual(result, 0, "Result should be zero when 'numbers' is empty")
    }

    func test_whenNumberStringIsOne_thenReturnOne() throws {
        let numbers = "1"

        let result = try self.sut.add(numbers)

        XCTAssertEqual(result, 1)
    }

    func test_whenNumberStringMoreThenOne_thenReturnInputDigit() throws {
        let numbers = "3"

        let result = try self.sut.add(numbers)

        XCTAssertEqual(result, 3)
    }

    func test_whenPassTwoNumbers_thenReturnTheirSum() throws {
        let numbers = "1,2"

        let result = try self.sut.add(numbers)

        XCTAssertEqual(3, result)
    }

    func test_whenPassAnotherTwoNumber_thenReturnTheirSum() throws {
        let numbers = "3,4"

        let result = try self.sut.add(numbers)

        XCTAssertEqual(7, result)
    }

    func test_whenPassFourNumbers_thenReturnTheirSum() throws {
        let numbers = "1,2,3,4"

        let result = try self.sut.add(numbers)

        XCTAssertEqual(10, result)
    }

    func test_whenPassTenNumbers_thenReturnTheirSum() throws {
        let numbers = "1,2,3,4,5,6,7,8,9,10"

        let result = try self.sut.add(numbers)

        XCTAssertEqual(55, result)
    }

    func test_whenPassThreeNumberWithOneNewLine_thenReturnTheirSum() throws {
        let numbers = "1\n2,3"

        let result = try self.sut.add(numbers)

        XCTAssertEqual(6, result)
    }

    func test_whenPassThreeNumberWithTwoNewLine_thenReturnTheirSum() throws {
        let numbers = "1\n2\n3"

        let result = try self.sut.add(numbers)

        XCTAssertEqual(6, result)
    }

    func test_whenPassNumberWithThreeNewLineAndTwoComma_thenReturnTheirSum() throws {
        let numbers = "5\n,6\n,7\n8"

        let result = try self.sut.add(numbers)

        XCTAssertEqual(26, result)
    }
    
    func test_whenPassInNumbersNewLineAfterComma_thenRaiseException() {
        let numbers = "1,\n"
        
        XCTAssertThrowsError(try self.sut.add(numbers)) { error in
            let throwError = error as! InputError
            XCTAssertEqual(throwError, InputError.invalidFormat)
        }
    }
    
    func test_whenPassNumbersWithTwoSlah_thenChangeDelimeterAndReturnSum() throws {
        let numbers = "//;\n1;2"
        
        let result = try self.sut.add(numbers)
        
        XCTAssertEqual(3, result)
    }
    
}
