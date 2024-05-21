//
//  MapView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/5/20.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate:CLLocationCoordinate2D
    
    var body: some View {
//        Map(coordinateRegion: .constant(region))
        MapWrapperView(coordinate: coordinate)
    }
}

private var region: MKCoordinateRegion {
    MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
}


// 创建 UIViewRepresentable 包装器
struct MapWrapperView: UIViewRepresentable {
    
    var coordinate:CLLocationCoordinate2D
      
    // MKMapView 的配置可以放在这里，比如初始位置、代理等
    private let mapView = MKMapView()
      
    func makeUIView(context: Context) -> MKMapView {
        // 配置 MKMapView，比如设置初始位置等
        let region = MKCoordinateRegion(center:coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        mapView.setRegion(region, animated: true)
        return mapView
    }
      
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // 视图更新时的处理（如果有的话）
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
