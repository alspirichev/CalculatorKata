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
    
    func test_whenTwoNumbers_returnSum() {
        let numbers = "1,2"
        
        let result = self.sut.add(numbers)
        
        XCTAssertEqual(result, 3)
    }

}
