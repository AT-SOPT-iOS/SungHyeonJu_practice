//
//  SheetDetailView.swift
//  week7
//
//  Created by 성현주 on 5/24/25.
//

import SwiftUI

struct SheetDetailView: View {
    @Binding var isPresneted: Bool
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.2)
                .ignoresSafeArea()
            VStack(spacing: 20){
                Text("시트뷰")
                    .font(.title)
                Button("닫기"){
                    isPresneted = false
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
    }
}


