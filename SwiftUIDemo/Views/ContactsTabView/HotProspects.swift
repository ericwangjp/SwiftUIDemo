//
//  HotProspects.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/18.
//

import SwiftUI
import UserNotifications

struct HotProspects: View {
    @State private var permissionTip: String?

    var body: some View {
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Label("所有人", systemImage: "person.3")
                }
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("已联系", systemImage: "checkmark.circle")
                }
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("未联系", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("我", systemImage: "person.crop.square")
                }
        }
    }


}

#Preview {
    HotProspects()
}
