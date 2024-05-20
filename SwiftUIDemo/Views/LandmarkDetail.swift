//
//  LandmarkDetail.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/5/20.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark:Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate).frame(height: 300)
            CircleImageView(image: landmark.image).offset(y:-130).padding(.bottom,-130)
            VStack(alignment: .leading) {
                Text(landmark.name).font(.title)
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }.font(.subheadline).foregroundStyle(.secondary)
                Divider()
                Text("About \(landmark.name)").font(.title2)
                Text(landmark.description)
            }.padding()
            Spacer()
        }.navigationTitle(landmark.name).navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
