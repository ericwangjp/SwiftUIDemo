//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/5/17.
//

import SwiftUI
import SwiftData

@main
struct SwiftUIDemoApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            HomeContentView().environment(modelData)
        }
        .modelContainer(for: [Book.self,Prospect.self])
    }
}


/** 自定义启动页效果
// 此种方式为伪启动页，会有系统启动页闪白，在启动较慢时较为明显
 
struct HomeContentView: View {
    @State private var isShowingSplash = true // 用于控制启动页是否显示
 
    // 使用DispatchQueue在短时间后隐藏启动页
    func hideSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation {
                self.isShowingSplash = false
            }
        }
    }
 
    var body: some View {
        Group {
            if isShowingSplash {
                // 启动页视图
                SplashView()
                    .onAppear(perform: hideSplash) // 当视图出现时，隐藏启动页
            } else {
                // 应用的主视图
                HomeView()
            }
        }
    }
}
 
// 启动页视图
struct SplashView: View {
    var body: some View {
        Text("Launching...")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
            .edgesIgnoringSafeArea(.all)
    }
}
 
// 主视图
struct HomeView: View {
    var body: some View {
        Text("Welcome to the app!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green)
            .edgesIgnoringSafeArea(.all)
    }
}
 
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            HomeContentView()
        }
    }
}
**/
