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
}

public class StringCalculator {
    func add(_ numbers: String) throws -> Int {
        guard !numbers.isEmpty else { return 0 }
        guard !numbers.contains(",\n") else {
            throw InputError.invalidFormat
        }
        
        let prefix = "//"
        var delimeter = ","
        
        if numbers.hasPrefix(prefix) {
            delimeter = String(numbers
                .dropFirst(prefix.count)
                .first!)
        }
        
        let digits = numbers.components(separatedBy: "\n")
            .flatMap { $0.components(separatedBy: delimeter) }
            .map { Int($0) }
            .compactMap { $0 }
        
        return digits.reduce(0, +)
    }
}
