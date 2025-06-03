//
//  ContentView.swift
//  week7
//
//  Created by 성현주 on 5/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ForEach(0..<20) { index in
            VStack{
                Color.orange
                    .clipShape(.rect)
                    .frame(height: 100)
                    .cornerRadius(8)

                Text("아이템 \(index)")
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .padding(10)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 0.3)
        )
        .background(.white)
        .cornerRadius(12)
        .shadow(radius: 1)
    }
}

#Preview {
    ContentView()
}
