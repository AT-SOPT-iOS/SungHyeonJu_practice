//
//  BaseUIViewController.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/15/25.
//

import UIKit

class BaseUIViewController: UIViewController {

    // MARK: - Properties

    // MARK: - UI Components


    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUI()
        setLayout()
        addTarget()
        setDelegate()
    }

    // MARK: - Custom Method

    open func setUI() {}

    open func setLayout() {}

    // MARK: - Action Method

    open func addTarget() {}

    // MARK: - delegate Method

    open func setDelegate() {}
}
