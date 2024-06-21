//
//  CupcakeCorner.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/16.
//

import SwiftUI

struct Response: Codable {
    var results: [CupcakeResult]
}

struct CupcakeResult: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


struct CupcakeCorner: View {
    @State private var results = [CupcakeResult]()
    @State private var counter = 0
    @State private var username = ""
    @State private var email = ""
    private var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    @State private var order = CakeOrder()
    
    
    var body: some View {       
        
        NavigationStack {
            Form {
                Section {
                    Picker("选择蛋糕类型", selection: $order.type){
                        ForEach(CakeOrder.types.indices, id: \.self){
                            Text(CakeOrder.types[$0])
                        }
                    }
                    
                    Stepper("蛋糕数量：\(order.quantity)", value: $order.quantity,in: 3...20)
                }
                
                Section {
                    Toggle("额外要求", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled {
                        Toggle("多加糖霜", isOn: $order.extraFrosting)
                        
                        Toggle("多加糖屑", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("派送地址"){
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("纸杯蛋糕中心")
        }
        
    }
    
}

#Preview {
    CupcakeCorner()
}
