//
//  ExpenseItem.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/14.
//

import Foundation

struct ExpenseItem : Identifiable,Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
