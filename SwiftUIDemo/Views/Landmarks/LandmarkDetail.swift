//
//  LandmarkDetail.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/5/20.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark:Landmark
    
    var landmarkIndex:Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate).frame(height: 300)
            CircleImageView(image: landmark.image).offset(y:-130).padding(.bottom,-130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name).font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }.font(.subheadline).foregroundStyle(.secondary)
                Divider()
                Text("About \(landmark.name)").font(.title2)
                Text(landmark.description)
            }.padding()
        }.navigationTitle(landmark.name).navigationBarTitleDisplayMode(.inline)
    }
}

//struct LandmarkDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        LandmarkDetail(landmark: ModelData().landmarks[0])
//    }
//}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0]).environment(modelData)
}
