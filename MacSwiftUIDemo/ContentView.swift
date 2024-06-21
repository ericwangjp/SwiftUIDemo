//
//  ContentView.swift
//  MacSwiftUIDemo
//
//  Created by wangjp on 2024/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
    
}

#Preview {
    ContentView()
        .environment(ModelData())
}
