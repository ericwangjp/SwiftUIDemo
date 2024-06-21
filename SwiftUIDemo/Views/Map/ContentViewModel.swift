//
//  ViewModel.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/17.
//

import Foundation
import Observation
import MapKit
import LocalAuthentication


extension BucketList {
    @Observable
    class ViewModel {
        private(set) var locations: [Location]
        var selectedPlace: Location?
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        var isUnlocked = false
        var errorTip = ""
        
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        
        func addLocation(at coordinate: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "未命名", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
            locations.append(newLocation)
            save()
        }
        
        func updateLocation(location: Location){
            guard let selectedPlace else {
                return
            }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
            
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
//                completeFileProtection 文件采用强加密存储
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        
//        人脸验证
        func authenticate() {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//                这里配置的字符串用于 Touch ID，而 Info.plist 中配置的字符串用于 Face ID
                let reason = "请验证你的身份来解锁你的位置"

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                    if success {
                        self.isUnlocked = true
                        print("生物验证通过")
                    } else {
                        // error
                        self.errorTip = authenticationError?.localizedDescription ?? "验证出错了，请重试"
                    }
                }
            } else {
                // 没有生物验证功能，直接通过
                self.isUnlocked = true
                print("没有生物验证功能")
            }
        }
    }
}

