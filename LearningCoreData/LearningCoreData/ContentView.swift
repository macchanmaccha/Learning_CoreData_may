//
//  ContentView.swift
//  LearningCoreData
//
//  Created by apple on 2023/04/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Memo.entity(),
        sortDescriptors: [NSSortDescriptor(key: "updatedAt", ascending: false)],
        animation: .default)
    var fetchedMemoList: FetchedResults<Memo>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(fetchedMemoList) { memo in
                    VStack {
                        Text(memo.title ?? "")
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(1)
                        HStack {
                            Text(memo.stringUpdatedAt)
                                .font(.caption)
                                .lineLimit(1)
                            Text(memo.content ?? "")
                                .font(.caption)
                                .lineLimit(1)
                            Spacer()
                        } // HStackここまで
                    } // VStackここまで
                }
            }
            .navigationTitle("メモ")
            .navigationBarTitleDisplayMode(.automatic)
        } // NavigationStackここまで
    } // bodyここまで
} // ContentViewここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
