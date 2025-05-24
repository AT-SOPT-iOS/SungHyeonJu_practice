//
//  InstagramView.swift
//  sopt_week6
//
//  Created by 성현주 on 5/17/25.
//

import SwiftUI

struct InstagramView: View {
    var chat = chatDummy

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<10) {_ in 
                        ZStack {
                            Image("icon")
                                .resizable()
                                .frame(width: 44, height: 44)
                        }
                    }
                }
            }

            ScrollView(.vertical){
                ForEach(0..<10) {_ in
                    HStack() {
                        Image("icon")
                            .resizable()
                            .frame(width: 44, height: 44)
                        VStack(alignment: .leading) {
                                Text("dd")
                                Text("dd")
                        }
                        Spacer()
                    }
                }

            }
        }
    }

}

#Preview {
    InstagramView()
}
