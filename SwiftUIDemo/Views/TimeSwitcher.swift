//
//  TimeSwitcher.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/12.
//

import SwiftUI


enum TimeUnit: String {
    case Second = "秒"
    case Minute = "分"
    case Hour = "时"
    case Day = "天"
}

struct TimeSwitcher: View {
    @FocusState private var inputIsFocused: Bool
    @State private var inputTime: Double = 0
    @State private var inputUnit = TimeUnit.Second.rawValue
    @State private var outputUnit = TimeUnit.Second.rawValue
    private let timeUnits = ["秒","分","时","天"]
    private var switchTime: Double {
        var localSecond = 0.0
        var transTime = 0.0
        // 统一换算成秒进行计算
        switch(inputUnit){
        case TimeUnit.Second.rawValue:
            localSecond = inputTime
        case TimeUnit.Minute.rawValue:
            localSecond = inputTime * 60
        case TimeUnit.Hour.rawValue:
            localSecond = inputTime * 60 * 60
        case TimeUnit.Day.rawValue:
            localSecond = inputTime * 24 * 60 * 60
        default:
            break
        }
        switch(outputUnit){
        case TimeUnit.Second.rawValue:
            transTime = localSecond
        case TimeUnit.Minute.rawValue:
            transTime = localSecond / 60
        case TimeUnit.Hour.rawValue:
            transTime = localSecond / 60 / 60
        case TimeUnit.Day.rawValue:
            transTime = localSecond / 24 / 60 / 60
        default:
            break
        }
        return transTime
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("输入时间") {
                    TextField("输入时间", value: $inputTime, format: .number)
                        .focused($inputIsFocused)
                        .keyboardType(.decimalPad)
                        .lineLimit(10)
                    
                    Picker("输入单位", selection: $inputUnit){
                        ForEach(timeUnits,id: \.self){
                            Text("\($0)")
                        }
                    }
                }
                
                Section("输出时间") {
                    Picker("输出单位", selection: $outputUnit){
                        ForEach(timeUnits,id: \.self){
                            Text("\($0)")
                        }
                    }
                    Text("\(switchTime.formatted())")
                }
            }
            .navigationTitle("时间转换")
            .toolbar(content: {
                if inputIsFocused {
                    Button("完成"){
                        inputIsFocused = false
                    }
                }
                
            })
        }
    }
}

#Preview {
    TimeSwitcher()
}
