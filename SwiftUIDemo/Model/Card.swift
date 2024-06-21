//
//  Card.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/18.
//

import Foundation

struct Card: Codable {
    var prompt: String
    var answer: String

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
