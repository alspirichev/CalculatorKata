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
        
        guard let digit = Int(numbers) else { return 0}
        return digit
    }
}
