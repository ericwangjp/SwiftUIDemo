//
//  CheckoutView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/16.
//

import SwiftUI

struct CheckoutView: View {
    var order: CakeOrder
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),scale: 3){ image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("总计 \(order.cost,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    .font(.title)
                
                Button("提交订单", action: {
                    Task {
                        await placeOrder()
                    }
                })
                    .padding()
            }
        }
        .navigationTitle("收银台")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("订单详情", isPresented: $showingConfirmation, actions: {
            Button("确定"){}
        }, message: {
            Text(confirmationMessage)
        })
    }
    
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(CakeOrder.self, from: data)
            confirmationMessage = "蛋糕详情：\(decodedOrder.quantity) x \(CakeOrder.types[decodedOrder.type].lowercased())"
            showingConfirmation = true
        } catch {
            print("提交订单失败: \(error.localizedDescription)")
        }
    }
}

#Preview {
    CheckoutView(order: CakeOrder())
}
