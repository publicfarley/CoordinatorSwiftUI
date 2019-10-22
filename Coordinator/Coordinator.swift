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
    
    enum Screen {
        case first
        case second
        case third
    }
    
    @State var screen: Screen = .first
    @State var buttonText: String = "Go!"
        
    var body: some View {
        currentView()
    }
    
    func currentView() -> AnyView {
        switch screen {
        case .first:
            return AnyView(Screen1(buttonText: "\(buttonText)",
                                   done: screen1Done))
        case .second:
            return AnyView(Screen2(doneWithPayload: screen2Done))
        
        case .third:
            return AnyView(Screen3(done: screen3Done))
        }
        
    }
    
    func screen1Done() {
        screen = .second
    }
    
    func screen2Done(with payLoad: String) {
        buttonText = payLoad
        screen = .third
    }
    
    func screen3Done() {
        screen = .first
    }
}
 
protocol DoneWithPayloadReporter {
    associatedtype Payload
    var doneWithPayload: (Payload) -> Void { get }
}
 
protocol DoneReporter {
    var done: () -> Void { get }
}

protocol CoordinatableView: View, DoneReporter {}
protocol CoordinatableViewWithPayload: View, DoneWithPayloadReporter {}
 
struct Screen1: CoordinatableView {
    let buttonText: String
    
    var done: () -> Void
    
    var body: some View {
        Button(action: done) {
            VStack {
                Text(buttonText)
                    .multilineTextAlignment(.center)
                Image(systemName: "tornado")
            }.font(.title)
        }
    }
}
 
struct Screen2: CoordinatableViewWithPayload {
    
    var doneWithPayload: (String) -> Void
    
    var body: some View {
        VStack {
            Text("Screen2").font(.title)
            Button(action: {
                self.doneWithPayload("Let's Go Again!")
            }) {
                Text("Go to the tabs!")
            }
        }
    }
}
 
struct Screen3: CoordinatableView {
 
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
 
            Text("Tab 3")
                .font(.largeTitle)
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
            }
        }
    }
}
