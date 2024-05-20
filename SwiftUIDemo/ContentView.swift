//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/5/17.
//

import SwiftUI

struct ContentView: View {
    @State var curValue = 0
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("用户中心").foregroundColor(Color.orange).underline().font(Font.system(size: 25))
            Image("ic_product_thumbnail").clipShape(Circle()).overlay{
                Circle().stroke(.white,lineWidth: 4)
            }.shadow(radius: 7)
            itemView()
            Label()
                .frame(height: 10.0).padding([.bottom, .trailing], 20)
                         .border(.gray)
            CustomView()
            NavigationView {
                List {
                    NavigationLink(destination: ImageContentView()){
                        ItemView()
                    }
                    ItemView()
                }.navigationBarTitle("通讯录",displayMode: .inline)
            }
            SimpleView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Label:UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        UILabel(frame: .zero)
    }
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = "UILabel"
    }
    
}

func itemView()-> some View {
    return HStack(alignment: .top){
        Image("ic_product_thumbnail").resizable().frame(width: 70,height: 70)
        VStack(alignment: .leading) {
            Text("张章").bold().font(Font.system(size: 25))
            Text("1588888888").font(Font.system(size: 20))
        }
    }
}

struct ItemView:View {
    var body: some View {
        HStack(alignment: .top){
            Image("ic_product_thumbnail").resizable().frame(width: 70,height: 70)
            VStack(alignment: .leading) {
                Text("张章").bold().font(Font.system(size: 25))
                Text("1588888888").font(Font.system(size: 20))
            }
        }
    }
}

struct ImageContentView:View {
    var body: some View {
        Image("ic_product_thumbnail")
    }
}

struct SimpleView:View {
    @State var count = 0
    var body: some View {
        VStack(alignment: .center, spacing: 10,content: {
            SimpleSubText(curValue: $count)
        })
    }
}

struct SimpleSubText:View {
    @Binding var curValue:Int
    var body: some View {
        Button(action: {
            self.curValue += 1
        }){
            Text("按钮")
        }
        Text("\(self.curValue)")
    }
}

struct CustomView:View {
    var body: some View {
        Path { path in
            let width = 100
            let height = 100
            path.addRoundedRect(in: CGRect(x: 10, y: 10, width: width, height: height), cornerSize: CGSize(width: 5, height: 5))
        }.stroke(Color.red,lineWidth: 5)
    }
}
