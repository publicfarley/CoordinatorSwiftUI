//
//  Screen3.swift
//  Coordinator
//
//  Created by Farley Caesar on 2019-11-24.
//  Copyright © 2019 AppObject. All rights reserved.
//

import SwiftUI

struct Screen3: View {
    @Binding var items: [String]

    var done: () -> Void
    
    var body: some View {
        TabView {
            VStack {
                Text("Tab 1")
                    .font(.largeTitle)
                Button(action: done) {
                    Text("Logout")
                }
            }
            .tabItem {
                Image(systemName: "1.square.fill")
                Text("First")
            }
 
            Text("Tab 2")
                .font(.largeTitle)
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
            }
 
            VStack {
                Text("Tab 3")
                    .font(.largeTitle)
                ItemTable(items: items)
            }
            .tabItem {
                Image(systemName: "3.square.fill")
                Text("Third")
            }
        }
    }
}

struct ItemTable: View {
    let items: [String]

    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Text("\(item)")
            }
        }
    }
}

struct Screen3_Previews: PreviewProvider {
    @State static var items: [String] = ["1","2"]
    
    static var previews: some View {
        Screen3(items: $items, done: {})
    }
}
