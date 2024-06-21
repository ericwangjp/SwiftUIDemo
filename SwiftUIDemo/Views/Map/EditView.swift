//
//  EditView.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/17.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    var location: Location
    var onSave: (Location) -> Void

    @State private var name: String
    @State private var description: String
    @State private var loadingState = LoadingState.loading
    @State private var pages = [LocationPage]()
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave

        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("地址", text: $name)
                    TextField("详情", text: $description)
                }
                
                Section("附近") {
                    switch loadingState {
                    case .loading:
                        ContentUnavailableView("加载中",systemImage: "arrow.clockwise.circle")
                    case .loaded:
                        ForEach(pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .failed:
                        ContentUnavailableView("加载失败",systemImage: "arrow.clockwise.circle")
                    }
                }
            }
            .navigationTitle("详细地址")
            .toolbar {
                Button("保存") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description

                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await fetchNearbyPlaces()
            }
        }
    }
    
    
    func fetchNearbyPlaces() async {
        loadingState = .loading
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"

        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // we got some data back!
            let items = try JSONDecoder().decode(LocationResult.self, from: data)

            // success – convert the array values to our pages array
            pages = items.query.pages.values.sorted()
            loadingState = .loaded
        } catch {
            // if we're still here it means the request failed somehow
            loadingState = .failed
        }
    }
}

enum LoadingState {
    case loading, loaded, failed
}

#Preview {
    EditView(location: .example,onSave: {_ in })
}
