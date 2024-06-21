//
//  MeView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/18.
//

import SwiftUI
// 使用 Core Image 过滤器来生成黑白二维码
import CoreImage.CIFilterBuiltins

struct MeView: View {
    @AppStorage("name") private var name = "Anonymous"
    @AppStorage("emailAddress") private var emailAddress = "you@yoursite.com"
    @State private var qrCode = UIImage()
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("姓名", text: $name)
                    .textContentType(.name)
                    .font(.title)

                TextField("邮箱", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                
                Image(uiImage: qrCode)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .contextMenu {

                        ShareLink(item: Image(uiImage: qrCode), preview: SharePreview("我的名片二维码", image: Image(uiImage: qrCode)))
                    }
            }
            .navigationTitle("我的二维码")
            .onAppear(perform: updateCode)
            .onChange(of: name, updateCode)
            .onChange(of: emailAddress, updateCode)
        }
    }
    
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(emailAddress)")
    }
}

#Preview {
    MeView()
}
