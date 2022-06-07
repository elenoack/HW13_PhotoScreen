//
//  Formatter+Extensions.swift
//  HW13_PhotoScreen
//
//  Created by mac on 06.06.22.
//

import UIKit

extension Formatter {
    
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        return formatter
    }()
}


