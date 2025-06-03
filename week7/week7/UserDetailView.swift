//
//  UserDetailView.swift
//  week7
//
//  Created by 성현주 on 5/24/25.
//

import SwiftUI

struct UserDetailView: View {
    let user: User

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .resizable()
                .frame(width: 140, height: 120)
                .foregroundColor(.green)

            Text(user.name)
                .font(.title)
                .bold()

            Text("나이: \(user.age)세")
                .font(.title2)

            Spacer()
        }
        .padding()
        .navigationTitle("상세 정보")
    }
}
