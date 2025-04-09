//
//  UIView+.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/5/25.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

