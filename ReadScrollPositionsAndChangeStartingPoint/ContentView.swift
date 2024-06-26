//
//  ContentView.swift
//  ReadScrollPositionsAndChangeStartingPoint
//
//  Created by Ramill Ibragimov on 26.06.2024.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
}

struct ScrollingView: View {
    
    let items = [
        Item(title: "Red", color: .red),
        Item(title: "Green", color: .green),
        Item(title: "Blue", color: .blue),
        Item(title: "Purple", color: .purple),
        Item(title: "Orange", color: .orange),
        Item(title: "Pink", color: .pink),
    ]
    
    @State var position = ScrollPosition(idType: Item.ID.self)
    
    var body: some View {
        VStack {
            Text(position.viewID.debugDescription)
            
            ScrollView {
                LazyVStack {
                    ForEach(items) { item in
                        item.color
                            .overlay {
                                VStack {
                                    Text(item.title)
                                    
                                    Text(item.id.uuidString)
                                        .foregroundStyle(.secondary)
                                }
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition($position, anchor: .bottom)
            .defaultScrollAnchor(.top)
        }
    }
}

struct ContentView: View {
    var body: some View {
        ScrollingView()
    }
}

#Preview {
    ContentView()
}
