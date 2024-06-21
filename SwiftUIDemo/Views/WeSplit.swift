//
//  WeSplit.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/7.
//

import SwiftUI

struct WeSplit: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [0, 10, 15, 20, 25, 30]
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = totalAmount / peopleCount
        return amountPerPerson
    }
    @FocusState private var amountIsFocused: Bool
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("账单信息") {
                    TextField("请输入账单总金额",value: $checkAmount,
                              format: .currency(code: Locale.current.currency?.identifier ?? "USD") )
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    .onChange(of: checkAmount) { oldValue,newValue in
                        print("myMoney: \(newValue)")
                    }
                    
                    Picker("分摊人数", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0)人")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("小费比例") {
                    Picker("小费比例", selection: $tipPercentage){
                        ForEach(tipPercentages,id: \.self) {
                            Text($0,format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("总分摊金额") {
                    Text(totalAmount,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("每人分摊金额") {
                    Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }

            }
            .navigationTitle("账单分摊")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                if amountIsFocused {
                    Button("完成") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    WeSplit()
}
