//
//  ChatViewController.swift
//  SOPT36_Week1
//
//  Created by 성현주 on 4/26/25.
//

import UIKit

import SnapKit

final class ChatViewController: UIViewController {

    //MARK: - properites

    private let tableView = UITableView(frame: .zero, style: .plain)
    private let chatList = ChatModel.dummy() //더미 데이터 주입


    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        register()
        setDelegate()
    }


    //MARK: Private Method
    
    private func setLayout() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
}

//MARK: - TableView Extension
extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}
