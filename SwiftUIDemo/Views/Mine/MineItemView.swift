//
//  MineItemView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/5.
//

import SwiftUI
import StoreKit

struct MineItemView: View {
    @ViewBuilder var tossResult: some View {
        if Bool.random() {
            Image("chincoteague")
                .resizable()
                .scaledToFit()
        } else {
            Text("Better luck next time")
                .font(.title)
        }
    }
    let title:String
    

    var body: some View {
        Text(title)











    }
}

#Preview {
    MineItemView(title: "账单分摊")
}
