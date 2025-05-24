//
//  StatePractice.swift
//  sopt_week6
//
//  Created by 성현주 on 5/17/25.
//

import SwiftUI

struct StatePractice: View {

    @State var name = "현수"

    var body: some View {
        VStack {
            Text(name)
            Button(action: {
                self.name = "나연"
            }) {
                Text("이름 바꾸기")
            }
        }
    }
}

struct ContentView1: View {
    @State var name = "현수"

    var body: some View {
        VStack {
            Text(name)
            NameChangeView(name: $name)
        }
    }
}

struct NameChangeView: View {
    @Binding var name: String

    var body: some View {
        Button("이름 바꾸기") {
            name = "나연"
        }
    }
}
#Preview {
    ContentView1()
}
