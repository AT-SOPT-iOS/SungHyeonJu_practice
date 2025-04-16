//
//  LoginViewController_Closure.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/12/25.
//

import UIKit

class LoginViewController_Closure: UIViewController {

    // MARK: - UIComponent
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 53, y: 163, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.subhead1
        return label
    }()

    let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = UIFont.subhead4
        textField.backgroundColor = .Gray200
        textField.layer.cornerRadius = 3
        textField.clearButtonMode = .always
        textField.addLeftPadding(width: 23)
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = UIFont.subhead4
        textField.backgroundColor = .Gray200
        textField.layer.cornerRadius = 3
        textField.clearButtonMode = .always
        textField.addLeftPadding(width: 23)
        return textField
    }()

    lazy var loginButton: BaseFillButton = {
        let button = BaseFillButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.setTitle("로그인하기", for: .normal)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        button.isEnabled = false
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
        configureTextFieldTargets()
    }

    //MARK: - ActionMethod
    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
        //presentWelcomeVC()
    }

    @objc
    private func textFieldsDidChange() {
        let isIDFilled = !(idTextField.text ?? "").isEmpty
        let isPasswordFilled = !(passwordTextField.text ?? "").isEmpty
        loginButton.isEnabled = isIDFilled && isPasswordFilled
    }

    //MARK: - PrivateMethod
    private func configureTextFieldTargets() {
        [idTextField, passwordTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        }
    }

    //MARK: - NavigationMethod

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()

        //프로퍼티로 구현
        //welcomeViewController.id = idTextField.text ?? ""

        //함수로 구현
        welcomeViewController.setLabelText(id: idTextField.text)
//        welcomeViewController.loginDataCompletion = {[weak self] data in print("제가 들고온 데이터는yo?", data)
//            guard let self else {return}
//            self.passwordTextField.text = data
//
//
//        }
        welcomeViewController.loginDataCompletion = { data in
            self.passwordTextField.text = data
        }



        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }

    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        self.present(welcomeViewController, animated: true)
    }
}

