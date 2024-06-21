//
//  LandmarkCommands.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/21.
//

import SwiftUI

struct LandmarkCommands: Commands {
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    
    var body: some Commands {
        SidebarCommands()
        
//        自定义菜单栏命令
        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove from" : "Mark as") Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}


private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}


extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}

