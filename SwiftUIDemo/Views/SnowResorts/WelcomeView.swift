//
//  WelcomeView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/19.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("欢迎来到滑雪度假胜地")
                .font(.largeTitle)

            Text("请从左侧菜单中选择度假村；从左边缘滑动以显示它。")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
