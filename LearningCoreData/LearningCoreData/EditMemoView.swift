//
//  EditMemoView.swift
//  LearningCoreData
//
//  Created by apple on 2023/04/30.
//

import SwiftUI

struct EditMemoView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var title: String
    @State private var content: String
    private var memo: Memo
    init(memo: Memo) {
        self.memo = memo
        self.title = memo.title ?? ""
        self.content = memo.content ?? ""
    } // initここまで
    var body: some View {
        VStack {
            TextField("タイトル", text: $title)
                .font(.title)
            TextEditor(text: $content)
                .font(.title)
            Spacer()
        } // VStackここまで
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("保存") {
                    saveMemo()
                }
            } // ToolbarItemここまで
        } // .toolbarここまで
    } // bodyここまで
    private func saveMemo() {
        memo.title = title
        memo.content = content
        memo.updatedAt = Date()
        try? viewContext.save()
    }
} // EditMemoViewここまで

struct EditMemoView_Previews: PreviewProvider {
    static var previews: some View {
        EditMemoView(memo: Memo())
    }
}
