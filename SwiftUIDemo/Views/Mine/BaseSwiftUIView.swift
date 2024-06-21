//
//  BaseSwiftUIView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/5.
//

import SwiftUI

struct BaseSwiftUIView: View {
    @ViewBuilder var first: some View {
        Image(systemName: "hand.wave")
        Text("First")
    }
    
    @ViewBuilder var second: some View {
        Text("Second")
        Image(systemName: "hand.wave")
    }
    
    struct Badge: ViewModifier {
        func body(content: Content) -> some View {
            content.font(.caption)
                .foregroundColor(.white)
                .padding(.horizontal,5)
                .padding(.vertical,2)
                .background{
                Capsule(style: .continuous).fill(.tint)
            }
        }
        
    }
    
    struct Shake:ViewModifier,Animatable {
        var numberOfShakes:Double
        var animatableData: Double {
            get { numberOfShakes }
            set { numberOfShakes = newValue }
        }
        
        func body(content: Content) -> some View {
            content.offset(x: -sin(numberOfShakes*2 * .pi)*30)
        }
    }
    
    @State private var flag = false
    @State private var shakes = 0
    
    var body: some View {
        
        Text("默认居中对齐,Hello,world")
//            .frame(width: 100, height: 100)
//            .lineLimit(5,reservesSpace: false)
//            .fixedSize()
        
        Text("Hello, World!")
            .frame(maxWidth: .infinity)
            .background(.quaternary)
        
        Text("Hello, World!")
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.teal)
        
        Text("Hello")
            .padding()
            .background(.teal)
            .badge{
                Text("2024")
                    .font(.caption)
                    .background(Circle().fill(.orange)
                        .frame(height: 30))
                
        }
        
        Divider()
        
        HStack {
            Spacer()
            Text("常规文本右对齐的实现方式")
        }
        
        Text("更推荐使用这种方式进行文本右对齐")
            .frame(maxWidth: .infinity,alignment: .trailing)
        
        Divider()
        
        HStack{
            Text("蜀道难，难于上青天！")
                .foregroundStyle(.white)
                .padding()
                .frame(maxHeight: .infinity)
                .background(.gray)
            Text("蜀道之难，难于上青天！蚕丛及鱼凫，开国何茫然！")
                .foregroundStyle(.white)
                .padding()
                .frame(maxHeight: .infinity)
                .background(.green)
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxHeight: 200)
        
        Divider()
        
        VStack {
            Button("登录") { }
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.gray)
                .clipShape(Capsule())
            
            Button("微信授权登录") { }
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.green)
                .clipShape(Capsule())
        }
        .fixedSize(horizontal: true, vertical: false)

        Divider()
        
        HStack {
            Text("文字展示").modifier(Badge())
            Divider()
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .frame(width: flag ? 100:50,height:50)
                .onTapGesture {
                withAnimation(.linear){
                    flag.toggle()
                }
            }
                .foregroundColor(.green)
        }.environment(\.font,.title)
        
        Divider()
        
        HStack {
            Image(systemName: "square.and.arrow.up")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .scaledToFit()
            
            Circle()
                .foregroundColor(.teal)
                .fixedSize()
            
            Color.red.fixedSize()
            
            Color.secondary.aspectRatio(4/3, contentMode: .fit)
            
            Rectangle().fill(.blue).fixedSize()
            Rectangle().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).fixedSize()
            
            Button("shake", action: {
                shakes += 1
            }).modifier(Shake(numberOfShakes: Double(shakes)))
                .animation(.default, value: shakes)
        }

        Divider()
        

        HStack(spacing: 20){
            first
            Spacer()
            second
        }
        
        HStack{
            Text("蜀道难，难于上青天！")
                .foregroundColor(.white)
                .background(.gray)
            Text("蚕丛及鱼凫，开国何茫然！默认是平分宽度，增加优先级可享受更多宽度")
                .foregroundColor(.white)
                .background(.green)
//                .layoutPriority(1)
        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<10) { i in
                    Text("Item \(i)")
                        .foregroundStyle(.white)
                        .containerRelativeFrame(.horizontal, count: 5, span: 2, spacing: 10)
                        .background(.blue)
                }
            }
        }

        
    }
}

#Preview {
    BaseSwiftUIView()
}
