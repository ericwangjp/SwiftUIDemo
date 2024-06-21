//
//  LocationResult.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/17.
//

import Foundation


struct LocationResult: Codable {
    let query: LocationQuery
}


struct LocationQuery: Codable {
    let pages: [Int: LocationPage]
}


struct LocationPage: Codable, Comparable {
    
    let pageid: Int
    let title: String
    let terms: [String:[String]]?
    
    var description: String {
        terms?["description"]?.first ?? "没有更多信息了"
    }
    
    static func < (lhs: LocationPage, rhs: LocationPage) -> Bool {
        lhs.title < rhs.title
    }
}
