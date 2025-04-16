//
//  AutoLayoutViewController.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/12/25.
//

import UIKit

final class AutoLayoutViewController: BaseUIViewController {
    
    //MARK: - Properites
    private let height = UIScreen.main.bounds.height / 4
    private let width = UIScreen.main.bounds.width / 2

    // MARK: - UIComponent

    private let yellowView = UIView()
    private let blackView = UIView()
    private let blueView = UIView()
    private let greenView = UIView()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubviews(yellowView,
                              greenView,
                              blackView,
                              blueView)
    }

    // MARK: - Private Method

    override func setUI(){
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        blackView.backgroundColor = .black
        blueView.backgroundColor = .blue
    }

    override func setLayout() {
        [yellowView, blueView, greenView, blackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: view.topAnchor),
            yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yellowView.heightAnchor.constraint(equalToConstant: height),
            yellowView.widthAnchor.constraint(equalToConstant: width),

            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenView.heightAnchor.constraint(equalToConstant: height),
            greenView.widthAnchor.constraint(equalToConstant: width),

            blackView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            blackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blackView.heightAnchor.constraint(equalToConstant: height),
            blackView.widthAnchor.constraint(equalToConstant: width),

            blueView.topAnchor.constraint(equalTo: blackView.bottomAnchor),
            blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blueView.heightAnchor.constraint(equalToConstant: height),
            blueView.widthAnchor.constraint(equalToConstant: width)
        ])
    }
}
