//
//  Expenses.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/14.
//

import Foundation
import Observation

@Observable
class Expenses {
    var items = [ExpenseItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.setValue(encoded, forKey: "expenseItems")
            }
        }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "expenseItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }

}
