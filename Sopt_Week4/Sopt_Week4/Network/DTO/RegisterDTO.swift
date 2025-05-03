//
//  RegisterDTO.swift
//  Sopt_Week4
//
//  Created by 성현주 on 5/3/25.
//

import Foundation


struct RegisterRequestModel: Codable {
    let loginId: String
    let password: String
    let nickname: String
}

struct RegisterResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: RegisterResponseModel
}

struct RegisterResponseModel: Codable {
    let userId: Int
    let nickname: String
}
