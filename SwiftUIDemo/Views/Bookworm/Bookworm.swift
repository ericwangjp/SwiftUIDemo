//
//  Bookworm.swift
//  SwiftUIDemo
//
//  Created by wangjp on 2024/6/16.
//

import SwiftUI
import SwiftData

struct Bookworm: View {
//    @Query var books: [Book]
//    根据书籍标题的字母顺序排序
//    @Query(sort: \Book.title) var books: [Book]
//    按评分从高到低排序
//    @Query(sort: \Book.rating, order: .reverse) var books: [Book]
//    多个排序规则，SortDescriptor默认按升序排列
    @Query(sort: [SortDescriptor(\Book.title),SortDescriptor(\Book.author)]) var books: [Book]
    // 模型上下文
    @Environment(\.modelContext) var modelContext
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationDestination(for: Book.self){ book in
                DetailView(book: book)
            }
            .navigationTitle("书虫")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("添加新书", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
       }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our query
            let book = books[offset]

            // delete it from the context
            modelContext.delete(book)
        }
    }
}

#Preview {
    Bookworm()
}
