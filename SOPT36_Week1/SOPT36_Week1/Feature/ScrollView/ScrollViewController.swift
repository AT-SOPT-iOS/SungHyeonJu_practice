//
//  ScrollViewController.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/12/25.
//

import UIKit

class ScrollViewController: UIViewController {

    //MARK: - Properties
    let boxHeight = 800.0

    // MARK: - UIComponent
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }

        setUI()
        setLayout()
    }

    //MARK: - Private Method
    private func setUI() {
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        purpleView.backgroundColor = .purple
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
    }

    private func setLayout() {
        [scrollView, contentView,
         redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: contentView.topAnchor),
            redView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            redView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            redView.heightAnchor.constraint(equalToConstant: boxHeight),

            orangeView.topAnchor.constraint(equalTo: redView.topAnchor),
            orangeView.leadingAnchor.constraint(equalTo: redView.trailingAnchor),
            orangeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            orangeView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            orangeView.heightAnchor.constraint(equalTo: redView.heightAnchor)
        ])

        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor),
            yellowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yellowView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            yellowView.heightAnchor.constraint(equalToConstant: boxHeight),

            greenView.topAnchor.constraint(equalTo: yellowView.topAnchor),
            greenView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor),
            greenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor),
            greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor)
        ])

        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blueView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            blueView.heightAnchor.constraint(equalToConstant: boxHeight),

            purpleView.topAnchor.constraint(equalTo: blueView.topAnchor),
            purpleView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor),
            purpleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            purpleView.widthAnchor.constraint(equalTo: blueView.widthAnchor),
            purpleView.heightAnchor.constraint(equalTo: blueView.heightAnchor),

            // 마지막 줄 뷰의 bottomAnchor → contentView에 연결해줘야 스크롤 가능
            purpleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }


}
