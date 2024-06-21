//
//  HomeContentView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/5/20.
//

import SwiftUI

struct HomeContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
        case mine
    }
    
    var body: some View {
//        TabView should be the parent view, with the tabs inside it having a NavigationStack as necessary
            TabView(selection: $selection) {
               CategoryHome()
                   .tabItem {
                       Label("精选", systemImage: "star")
                   }
                   .tag(Tab.featured)


               LandmarkList()
                   .tabItem {
                       Label("列表", systemImage: "list.bullet")
                   }
                   .tag(Tab.list)

               MineContentView()
                   .tabItem {
                       Label("我的", systemImage: "person")
                   }
                   .tag(Tab.mine)
            }

    }
}

//struct HomeContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeContentView().environment(ModelData())
//    }
//}


#Preview {
    HomeContentView().environment(ModelData())
}
