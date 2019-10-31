//
//  Coordinator.swift
//  SwiftUI-Coordinator
//
//  Created by Farley Caesar on 2019-10-22.
//  Copyright © 2019 Farley Caesar. All rights reserved.
//
 
import Foundation
import SwiftUI
 
struct MainCoordinator: View {
    
    @State private var food: [String] = []
    static let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    
    enum Screen: Int {
        case first
        case second
        case third
    }
    
    @State var screen: Screen = .first
    @State var buttonText: String = "✨Go✨"
        
    var body: some View {
        VStack {
            if self.screen.rawValue == 0 {
                Screen1(buttonText: "\(self.buttonText)", done: self.screen1Done)
                .transition(.backwardScreenTransition)
            } else if self.screen.rawValue == 1 {
                Screen2(doneWithPayload: self.screen2Done)
                    .transition(.forwardScreenTransition)
            } else if self.screen.rawValue == 2 {
                Screen3(items: $food, done: self.screen3Done)
                    .transition(.forwardScreenTransition)
            }
        }.onReceive(MainCoordinator.timer) { _ in
            let numberOfItems = Int.random(in: 1..<10)
            self.food = Array(repeating: "🥝 Yummy!", count: numberOfItems)
        }
    }
        
    func screen1Done() {
        withAnimation {
            screen = .second
        }
    }
    
    func screen2Done(with payLoad: String) {
        withAnimation {
            buttonText = payLoad
            screen = .third
        }
    }
    
    func screen3Done() {
        withAnimation {
            screen = .first
        }
    }
}
  
struct Screen1: View {
    let buttonText: String
    
    var done: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Home Screen")
                .font(.largeTitle)
            
            Spacer()
            
            Button(action: done) {
                VStack {
                    Text(buttonText)
                        .multilineTextAlignment(.center)
                    Image(systemName: "tornado")
                }.font(.largeTitle)
            }
            
            Spacer()
        }
    }
}
 
struct Screen2: View {
    
    var doneWithPayload: (String) -> Void
    
    var body: some View {
        VStack {
            Text("Screen2").font(.title)
            Button(action: {
                self.doneWithPayload("Go Again!")
            }) {
                Text("Go to the tabs!")
            }
        }
    }
}
 
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
                MyTable(items: $items)
            }
            .tabItem {
                Image(systemName: "3.square.fill")
                Text("Third")
            }
        }
    }
}


struct MainCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        MainCoordinator()
    }
}

extension AnyTransition {
    static var forwardScreenTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        let removal = AnyTransition.move(edge: .leading).combined(with: .opacity)

        return .asymmetric(insertion: insertion, removal: removal)
    }

    static var backwardScreenTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading).combined(with: .opacity)
        let removal = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct MyTable: View {
    @Binding var items: [String]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Text("\(item)")
            }
        }
    }
}
