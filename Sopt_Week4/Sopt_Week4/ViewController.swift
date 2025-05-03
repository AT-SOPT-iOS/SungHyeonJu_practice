//
//  ViewController.swift
//  Sopt_Week4
//
//  Created by 성현주 on 5/3/25.
//

import UIKit

import Then
import SnapKit

final class LoginViewController: BaseUIViewController {

    //MARK: - Properties
    private var loginId: String = ""
    private var password: String = ""
    private var nickName: String = ""

    //MARK: - UI Component
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }

    private lazy var idTextField = UITextField().then {
        $0.backgroundColor = .lightGray
        $0.placeholder = "아이디를 입력하슈"
    }

    private lazy var passwordTextField = UITextField().then {
        $0.backgroundColor = .lightGray
        $0.placeholder = "패스워드를 입력하슈"
    }

    private lazy var nickNameTextField = UITextField().then {
        $0.backgroundColor = .lightGray
        $0.placeholder = "닉네임을 입력하슈"
    }

    private lazy var registerButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.textColor = .white
    }

    private lazy var infoViewButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("회원정보 조회", for: .normal)
        $0.titleLabel?.textColor = .white
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }

    //MARK: - Custum Method
    override func setUI() {
        self.view.addSubview(stackView)
        [idTextField, passwordTextField, nickNameTextField, registerButton, infoViewButton].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }

    override func setLayout() {
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(200)
        }
    }

    override func addTarget() {
        idTextField.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .allEvents)
        passwordTextField.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .allEvents)
        nickNameTextField.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .allEvents)
        infoViewButton.addTarget(self, action: #selector(infoViewButtonTap), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
    }

    //MARK: - Action Method
    @objc
    private func infoViewButtonTap() {
//        let infoVC = InfoViewController()
//        self.present(infoVC, animated: true)
    }

    @objc
    private func registerButtonTap() {
         Task {
             do {
                 let response = try await RegisterService.shared.PostRegisterData(loginId: self.loginId,
                                                                                  password: self.password,
                                                                                  nickName: self.nickName)

                 let alert = UIAlertController(
                     title: "계정 생성 성공",
                     message: "환영합니다, \(response.nickname)님! (ID: \(response.userId))",
                     preferredStyle: .alert
                 )

                 let okAction = UIAlertAction(title: "확인", style: .default)
                 alert.addAction(okAction)
                 self.present(alert, animated: true)
             } catch {
                 let alert = UIAlertController(
                     title: "계정 생성 실패",
                     message: error.localizedDescription,
                     preferredStyle: .alert
                 )
                 let okAction = UIAlertAction(title: "확인", style: .default)
                 alert.addAction(okAction)
                 self.present(alert, animated: true)

                 print("회원가입 에러:", error)
             }
         }
     }

    @objc
    private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            loginId = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            nickName = textField.text ?? ""
        }
    }

}

