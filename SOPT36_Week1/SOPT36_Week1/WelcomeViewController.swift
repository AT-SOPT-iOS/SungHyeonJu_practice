//
//  WelcomeViewController.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/5/25.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Properties
    var id: String?

    // MARK: - UIComponent
    lazy var welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 161, width: 236, height: 44))
        label.text = "\(id)님 \n반가워요!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    lazy var raabitImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 150, y: 280, width: 100, height: 100))
        imageView.image = ImageLiterals.rabbit
        return imageView
    }()

    var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(mainButtonDidTapped), for: .touchUpInside)
        return button
    }()

    var reLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 500, width: 332, height: 58))
        button.backgroundColor =  UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(reLoginButtonDidTapped), for: .touchUpInside)
        return button
    }()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubviews(welcomeLabel,
                              mainButton,
                              reLoginButton,
                              raabitImageView)
        //bindID()
    }

    //MARK: - ActionMethod
    @objc
    private func reLoginButtonDidTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }

    @objc
    private func mainButtonDidTapped() {
        print("메인으로!")
    }

    //MARK: - PrivateMethod


    //프로퍼티로 구현
    private func bindID() {
        self.welcomeLabel.text = "\(id)님 \n반가워요!"
    }


    //함수로 구현
    func setLabelText(id: String?) {
        self.id = id
    }

    //MARK: - NavigationMethod

}

//MARK: - Preview
#Preview("VC", traits: .defaultLayout, body: {
    WelcomeViewController()
})

