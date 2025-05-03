//
//  NicknameService.swift
//  Sopt_Week4
//
//  Created by 성현주 on 5/3/25.
//

import Foundation

class NicknameService {
    static let shared = NicknameService()
    private init() {}


    func makeRequest(keyword: String?, userId: Int) -> URLRequest? {
        var urlString = "https://api.atsopt-seminar4.site/api/v1/users"

        if let keyword = keyword, !keyword.isEmpty {
           if let encodedKeyword = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                urlString += "?nickname=\(encodedKeyword)"
            }
        }
        guard let url = URL(string: urlString) else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(userId), forHTTPHeaderField: "userId")
        return request
    }

    func fetchNicknameList(keyword: String?, userId: Int) async throws -> [String] {
        guard let request = makeRequest(keyword: keyword, userId: userId) else {
            throw NetworkError.requestEncodingError
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }

        do {
            let decoded = try JSONDecoder().decode(NicknameListResponseWrapper.self, from: data)
            return decoded.data.nicknameList
        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseDecodingError
        }

    }

    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }

}

