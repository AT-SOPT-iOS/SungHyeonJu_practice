//
//  ViewController.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/5/25.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties

    // MARK: - UIComponent
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = .systemFont(ofSize: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = .systemFont(ofSize: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()

    var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubviews(titleLabel,
                              idTextField,
                              passwordTextField,
                              loginButton)
    }

    //MARK: - ActionMethod
    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
        //presentWelcomeVC()
    }

    //MARK: - PrivateMethod


    //MARK: - NavigationMethod

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = idTextField.text ?? ""
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }

    private func presentHalfModalTOWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .pageSheet

        if let sheet = welcomeViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }

        self.present(welcomeViewController, animated: true, completion: nil)
    }

    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        self.present(welcomeViewController, animated: true)
    }
}

//MARK: - Preview
#Preview("VC", traits: .defaultLayout, body: {
    LoginViewController()
})
