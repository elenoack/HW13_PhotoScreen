//
//  UIView+Constraints.swift
//  HW13_PhotoScreen
//
//  Created by mac on 06.06.22.
//

import UIKit

extension UIView {
    
    func addSubviewsForAutoLayout(_ views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
}


