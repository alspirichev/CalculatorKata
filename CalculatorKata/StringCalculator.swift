//
//  StringCalculator.swift
//  CalculatorKata
//
//  Created by Alexander Spirichev on 18.09.2019.
//  Copyright © 2019 Alexander Spirichev. All rights reserved.
//

import Foundation

public class StringCalculator {
    func add(_ numbers: String) -> Int {
        guard !numbers.isEmpty else { return 0 }
        
        let digits = numbers.components(separatedBy: "\n")
            .flatMap { $0.components(separatedBy: ",") }
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .map { Int($0) }
            .compactMap { $0 }
        
        return digits.reduce(0, +)
    }
}
