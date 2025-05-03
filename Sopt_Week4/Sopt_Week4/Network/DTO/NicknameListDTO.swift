//
//  NicknameListDTO.swift
//  Sopt_Week4
//
//  Created by 성현주 on 5/3/25.
//

import Foundation
struct NicknameListResponseModel: Codable {
    let nicknameList: [String]
}

struct NicknameListResponseWrapper: Codable {
    let data: NicknameListResponseModel
}

struct Nickname: Codable {
    let nickname: String
}

