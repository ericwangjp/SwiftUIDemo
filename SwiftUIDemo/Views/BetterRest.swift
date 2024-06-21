//
//  BetterRest.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/13.
//

import SwiftUI
import CoreML

struct BetterRest: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1.0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                VStack(alignment: .leading) {
                    Text("你想几点醒来？")
                        .font(.headline)
                    
                    DatePicker("请输入一个时间", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                
                VStack(alignment: .leading) {
                    Text("期望的睡眠时长")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted())小时", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                

                
                VStack(alignment: .leading) {
                    Text("每天咖啡摄入量")
                    
                    Stepper("\(coffeeAmount.formatted()) 杯", value: $coffeeAmount, in: 1...20)
                }
                
                
                Section {
                    Text("建议入睡时间：\(alertMessage)")
                }
                


            }
            .navigationTitle("最佳睡眠时间")
            .toolbar{
                Button("计算",action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert){
                Button("确定"){}
            } message: {
                Text(alertMessage)
            }
        }

    }
    
    func calculateBedtime(){
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour+minute), estimatedSleep: sleepAmount, coffee: coffeeAmount)
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "最佳入睡时间"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        }catch{
            alertTitle = "出错了"
            alertMessage = "抱歉，计算出错"
        }
        showingAlert = true
    }
}

#Preview {
    BetterRest()
}
