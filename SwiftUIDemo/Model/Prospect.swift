//
//  Prospect.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/18.
//

import Foundation
import SwiftData


/**
 SwiftData 的@Model宏只能在类上使用，但这意味着我们可以在多个视图中共享该对象的实例，以使它们全部自动保持最新
 */
@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    
    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
    }
}
