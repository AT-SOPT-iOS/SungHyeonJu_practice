//
//  UIButton+.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/10/25.
//

import UIKit

extension UIButton {

    /// Button 타이틀 속성 지정
    func addTitleAttribute(title: String, titleColor: UIColor, fontName: UIFont) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = fontName
    }
}
