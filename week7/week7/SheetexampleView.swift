//
//  SheetexampleView.swift
//  week7
//
//  Created by 성현주 on 5/24/25.
//

import SwiftUI

struct SheetexampleView: View {
    @State private var isSheetPresented = false
    var body: some View {

        VStack(spacing: 50) {
            Text("메인 화면")
                .font(.largeTitle)
            Button("시트열기"){
                isSheetPresented = true
            }
        }
        .sheet(isPresented: $isSheetPresented){

        }
    }
}
#Preview {
    SheetexampleView()
}
