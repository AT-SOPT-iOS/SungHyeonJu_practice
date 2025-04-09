//
//  BaseFillButton.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/10/25.
//

import UIKit

class BaseFillButton: UIButton {

    override var isEnabled: Bool {
        didSet {
            isEnabled ? setEnableButton() : setDisableButton()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFillButton()
        self.isEnabled = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupFillButton() {
        self.addTitleAttribute(title: "", titleColor: .white, fontName: .subhead1)
        self.layer.cornerRadius = 6
    }

    private func setEnableButton() {
        isUserInteractionEnabled = true
        backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
    }

    private func setDisableButton() {
        isUserInteractionEnabled = false
        backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        setTitleColor(UIColor(red: 182/255, green: 172/255, blue: 185/255, alpha: 1), for: .normal) 
    }
}
