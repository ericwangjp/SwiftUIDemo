//
//  User.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/14.
//

import Foundation
import Observation

@Observable
class User: Codable {
    var name = "Taylor"
    var firstName = "aa"
    var lastName = "cc"
    
    // 用于JSON 序列化
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
}
