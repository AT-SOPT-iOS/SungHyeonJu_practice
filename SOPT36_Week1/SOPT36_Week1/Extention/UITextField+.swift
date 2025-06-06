//
//  UITextField+.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/10/25.
//

import UIKit

extension UITextField {

    func addLeftPadding(width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
