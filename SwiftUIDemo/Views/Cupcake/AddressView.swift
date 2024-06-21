//
//  AddressView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/16.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: CakeOrder
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("姓名", text: $order.name)
                    TextField("街道", text: $order.streetAddress)
                    TextField("城市", text: $order.city)
                    TextField("邮编", text: $order.zip)
                }
                
                Section {
                    NavigationLink("结账"){
                        CheckoutView(order: order)
                    }
                }
                .disabled(order.hasValidAddress == false)
            }
            .navigationTitle("派送详情")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

#Preview {
    AddressView(order: CakeOrder())
}
