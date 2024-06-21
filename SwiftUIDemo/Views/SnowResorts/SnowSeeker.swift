//
//  SnowSeeker.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/19.
//

import SwiftUI

struct SnowSeeker: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @State private var favorites = Favorites()
    @State private var searchText = ""
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
           resorts
        } else {
            resorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }


    var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) 人次")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                            .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("度假胜地")
            .navigationDestination(for: Resort.self){ resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "搜索度假胜地")
        } detail: {
            WelcomeView()
        }
        .environment(favorites)

    }

}

#Preview {
    SnowSeeker()
}
