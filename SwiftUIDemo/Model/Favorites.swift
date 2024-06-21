//
//  Favorites.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/19.
//

import Foundation


@Observable
class Favorites {
    // 用户收藏数据
    private var resorts: Set<String>

    // the key using to read/write in UserDefaults
    private let key = "Favorites"

    init() {
        // load our saved data
        if let savedFavorites = UserDefaults.standard.data(forKey: key){
            if let decodedItems = try? JSONDecoder().decode([String].self, from: savedFavorites){
                resorts = Set(decodedItems)
                return
            }
        }
        // still here? Use an empty array
        resorts = []
    }

    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    // adds the resort to our set and saves the change
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set and saves the change
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }

    func save() {
        // write out our data
        // UserDefaults 不支持直接存储 Set 类型，需要转为 array 或者编码为 JSON 存储
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(resorts){
            UserDefaults.standard.set(data, forKey: key)
        }
        
    }
}
