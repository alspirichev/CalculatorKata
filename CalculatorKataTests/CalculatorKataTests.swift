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

    func test_whenNumbersStringIsEmpty_returnZero() {
        let numbers = ""
        
        let result = self.sut.add(numbers)
        
        XCTAssertEqual(result, 0, "Result should be zero when 'numbers' is empty")
    }
    
    func test_whenNumberStringIsOne_thenReturnOne() {
        let numbers = "1"
        
        let result = self.sut.add(numbers)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_whenNumberStringMoreThenOne_thenReturnInputDigit() {
        let numbers = "3"
        
        let result = self.sut.add(numbers)

        XCTAssertEqual(result, 3)
    }

}
