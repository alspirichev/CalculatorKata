//
//  StringCalculator.swift
//  CalculatorKata
//
//  Created by Alexander Spirichev on 18.09.2019.
//  Copyright © 2019 Alexander Spirichev. All rights reserved.
//

import Foundation

enum InputError: Error {
    case invalidFormat
    case negativeNumbers(_ numbers: [Int])
}

public class StringCalculator {
    func add(_ numbers: String) throws -> Int {
        guard !numbers.isEmpty else { return 0 }
        guard !numbers.contains(",\n") else {
            throw InputError.invalidFormat
        }
        
        let prefix = "//"
        var delimeter = ","
        var negativeNumbers: [Int] = []
        
        if numbers.hasPrefix(prefix) {
            delimeter = String(numbers
                .dropFirst(prefix.count)
                .first!)
        }
        
        let digits: [Int] = numbers.components(separatedBy: "\n")
            .flatMap { $0.components(separatedBy: delimeter) }
            .map { Int($0) }
            .compactMap { $0 }
            .map {
                if $0 < 0 {
                    negativeNumbers.append($0)
                }
                return $0
        }
        
        if !negativeNumbers.isEmpty {
            throw InputError.negativeNumbers(negativeNumbers)
        }
        
        return digits.reduce(0, +)
    }
}

// MARK: - InputError Equatable

extension InputError: Equatable {
    static public func ==(lhs: InputError, rhs: InputError) -> Bool {
        switch (lhs, rhs) {
            case let (.negativeNumbers(a), .negativeNumbers(b)):
                return a == b
            
            case (.invalidFormat, .invalidFormat):
                return true
            default:
                return false
        }
    }
}
