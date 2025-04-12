//
//  AutoLayoutViewController.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/12/25.
//

import UIKit

final class AutoLayoutViewController: UIViewController {
    //MARK: - Properites
    let height = UIScreen.main.bounds.height / 4
    let width = UIScreen.main.bounds.width / 2

    // MARK: - UIComponent
    lazy var yellowView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        view.backgroundColor = .yellow
        return view
    }()

    lazy var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubviews(yellowView,
                              greenView,
                              blackView,
                              blueView)
        setConstraints()
    }

    // MARK: - Private Method

    private func setConstraints() {
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
