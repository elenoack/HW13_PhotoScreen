//
//  UInt Extensions.swift.swift
//  HW13_PhotoScreen
//
//  Created by mac on 06.06.22.
//

import Foundation

extension UInt {
    
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
} 
