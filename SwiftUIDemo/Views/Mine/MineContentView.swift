//
//  MineContentView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/5.
//

import SwiftUI

struct MineContentView: View {
    @State private var showing = false

    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        
        
        NavigationSplitView(sidebar: {
            Form {
                NavigationLink(destination: WeSplit()){
                    MineItemView(title: "账单分摊")
                }
                NavigationLink(destination: TimeSwitcher()){
                    MineItemView(title: "时间转换")
                }
                NavigationLink(destination: GuessingNationalFlagGame()){
                    MineItemView(title: "猜国旗")
                }
                
                NavigationLink(destination: BetterRest()){
                    MineItemView(title: "睡眠时间计算")
                }
                
                NavigationLink(destination: WordScramble()){
                    MineItemView(title: "单词游戏")
                }
                
                NavigationLink(destination: iExpense()){
                    MineItemView(title: "花费列表")
                }
                
                NavigationLink(destination: CupcakeCorner()){
                    MineItemView(title: "纸杯蛋糕")
                }
                
                NavigationLink(destination: Bookworm()){
                    MineItemView(title: "书虫")
                }
                
                NavigationLink(destination: PhotoPickerGallery()){
                    MineItemView(title: "照片滤镜与分享好评")
                }
                
                NavigationLink(destination: BucketList()){
                    MineItemView(title: "地图标记")
                }
                
                NavigationLink(destination: HotProspects()){
                    MineItemView(title: "联系人与通知")
                }
                
                NavigationLink(destination: Flashzilla()){
                    MineItemView(title: "拖拽卡片")
                }
                
                NavigationLink(destination: SnowSeeker()){
                    MineItemView(title: "滑雪度假胜地")
                }
                
                
                
                NavigationLink(destination: TempView()){
                    MineItemView(title: "功能测试")
                }
                
                Section {
                    Button(showing ? "登录": "退出登录") {
                        showing.toggle()
                    }
                    .alert("登录", isPresented: $showing) {
                        TextField("账号", text: $username)
                        SecureField("密码", text: $password)
                        Button("登录", role: .destructive,action: {})
                        Button("取消", role: .cancel) { }
                    } message: {
                        Text("请输入账号密码")
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationBarTitle("我的",displayMode: .inline)
        }, detail: {
            WeSplit()
        })
        

        
        
    }

}

//class MyStore: ObservableObject {
//    @Published var selection: Int?
//}
//
//struct MineContentView: View {
//    @StateObject var store = MyStore()
//    var body: some View {
//        NavigationSplitView {
//            SideBarView()
//        } detail: {
//            DetailView()
//                .toolbar {
//                    EditButton() // 在 Detail 栏中的 NavigationView 创建按钮
//                }
//                .navigationTitle("Detail")
//        }
//        .environmentObject(store)
//    }
//}
//
//struct SideBarView: View {
//    @EnvironmentObject var store: MyStore
//    var body: some View {
//        // 可以在 List 中直接绑定数据，无需通过 Button 显式进行修改
//        List(0..<30, id: \.self, selection: $store.selection) { i in
//            NavigationLink("ID: \(i)", value: i)  // 使用编程式的 NavigationLink
////            Text("ID: \(i)")
//        }
//    }
//}
//
//struct DetailView: View {
//    @EnvironmentObject var store: MyStore
//    var body: some View {
//        NavigationStack {
//            VStack {
//                if let selection = store.selection {
//                    NavigationLink("查看详情", value: selection)
//                } else {
//                    Text("请选择")
//                }
//            }
//            .navigationDestination(for: Int.self, destination: {
//                Text("\($0)")
//            })
//            .toolbar {
//                RenameButton() // 在 Detail 栏中的 NavigationView 创建按钮
//            }
//            .navigationTitle("Detail InLine")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}


#Preview {
    MineContentView()
}
