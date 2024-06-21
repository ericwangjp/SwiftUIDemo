//
//  iExpense.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/14.
//

import SwiftUI

struct iExpense: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false

    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items){ item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
                .onDelete(perform: removeRows)
            }
            .navigationTitle("花费列表")
            .toolbar {
                Button("增加花费",systemImage: "plus"){
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
//                    expenses.items.append(expense)
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    iExpense()
}
