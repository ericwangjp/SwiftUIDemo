//
//  CircleImageView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/5/20.
//

import SwiftUI

struct CircleImageView: View {
    var image:Image
    
    var body: some View {
        image.clipShape(Circle()).overlay{
            Circle().stroke(.white,lineWidth: 4)
        }.shadow(radius: 7)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image("turtlerock"))
    }
}
