//
//  ResortDetailsView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/19.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort
    var size: String {
        switch resort.size {
        case 1: "小"
        case 2: "中等"
        default: "大"
        }
    }
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    
    
    var body: some View {
        Group {
            VStack {
                Text("规模")
                    .font(.caption.bold())
                Text(size)
                    .font(.title3)
            }

            VStack {
                Text("价格")
                    .font(.caption.bold())
                Text(price)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ResortDetailsView(resort: .example)
}
