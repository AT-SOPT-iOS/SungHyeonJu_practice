//
//  ChatView.swift
//  sopt_week6
//
//  Created by 성현주 on 5/17/25.
//

import SwiftUI

struct ChatView: View {
    var chat = chatDummy

    var body: some View {
        List(chat) { chat in
            HStack {
                Image("movie2")
                    .resizable()
                    .frame(width: 44, height: 44)
                VStack(alignment: .leading) {
                    HStack{
                        Text(chat.name)
                        Text(chat.location)
                    }
                    Text(chat.message)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Image("movie2")
                    .resizable()
                    .frame(width: 44, height: 44)
            }

        }
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<10) {
                    Text("숫자 \($0)")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .background(Color.yellow)
                }
            }
            .frame(maxHeight: .infinity)
        }
    }

}


#Preview {
    ChatView()
}
