//
//  UIStackView Extensions.swift.swift
//  HW13_PhotoScreen
//
//  Created by mac on 06.06.22.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviewsForAutoLayout(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
