//
//  WelcomeViewController_DelegatePattern.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/12/25.
//

import UIKit


protocol DataBindDelegate: AnyObject {
    func dataBind(id: String)
}


final class WelcomeViewController_DelegatePattern: UIViewController {

    // MARK: - Properties
    private var id: String?
    weak var delegate : DataBindDelegate?

    // MARK: - UIComponent
    lazy var welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.head1
        return label
    }()

    lazy var raabitImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = ImageLiterals.rabbit
        return imageView
    }()

    lazy var mainButton: BaseFillButton = {
        let button = BaseFillButton(frame: CGRect(x: 20, y: 426, width: 332, height: 58))
        button.setTitle("메인으로", for: .normal)

        //button disable때문에 구현을위해 임의로 셀렉터함수 변경했습니다
        button.addTarget(self, action: #selector(reLoginButtonDidTapped), for: .touchUpInside)
        return button
    }()

    lazy var reLoginButton: BaseFillButton = {
        let button = BaseFillButton(frame: CGRect(x: 20, y: 498, width: 332, height: 58))
        button.setTitle("다시 로그인", for: .normal)
        button.addTarget(self, action: #selector(reLoginButtonDidTapped), for: .touchUpInside)
        button.isEnabled = false
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
        bindID()
    }

    //MARK: - ActionMethod
    @objc
    private func reLoginButtonDidTapped() {
        if let id = id {
            delegate?.dataBind(id: id)
            print(id)
        }

        if self.navigationController == nil {
            self.dismiss(animated: true) //prent로 호출 된경우
        } else {
            self.navigationController?.popViewController(animated: true) //push로 호출 된 경우
        }
    }

    @objc
    private func mainButtonDidTapped() {
        print("메인으로!")
    }

    //MARK: - PrivateMethod

    private func bindID() {
        guard let id = id, !id.isEmpty else {
            self.welcomeLabel.text = "???님\n반가워요!"
            return
        }
        self.welcomeLabel.text = "\(id)님\n반가워요!"
    }

    //MARK: - HelperMethod

    public func setLabelText(id: String?){
            self.id = id
        }
}


