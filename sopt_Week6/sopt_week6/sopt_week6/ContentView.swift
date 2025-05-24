//
//  ContentView.swift
//  sopt_week6
//
//  Created by 성현주 on 5/17/25.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("item1")
                .resizable()
                .frame(width: 300, height: 300)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)

                HStack {
                    Text("차이폰")
                        .font(.headline)
                    Text("아이폰 12")
                        .font(.subheadline)
                }
                Text("200,000,000원")
                    .font(.headline)
                    .foregroundColor(.orange)
        }
    }
}

struct SampleListView: View {
    let items = ["사과", "바나나", "오렌지", "포도", "수박", "망고", "어쩌고", "저쩌고", "졸려요"]

    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
        }
    }
}

#Preview {
    ContentView()
    SampleListView()
}
