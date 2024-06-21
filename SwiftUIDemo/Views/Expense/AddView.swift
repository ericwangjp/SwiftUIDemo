//
//  AddView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/14.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)

                Picker("类型", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("金额", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("添加新的花费")
            .toolbar {
                Button("保存") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
