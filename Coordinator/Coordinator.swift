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
    
    enum Screen: Int {
        case first
        case second
        case third
    }
    
    @State var screen: Screen = .first
        
    var body: some View {
        VStack {
            if screen.isEqualTo(Screen.first) {
                Screen1(done: self.screen1Done)
                .transition(.backwardScreenTransition)
            } else if screen.isEqualTo(Screen.second) {
                Screen2(done: self.screen2Done)
                    .transition(.forwardScreenTransition)
            } else if screen.isEqualTo(Screen.third) {
                // Return a sub-coordinator instead of a screen
                Screen3Coordinator(done: self.screen3Done)
            }
        }
    }
        
    func screen1Done() {
        withAnimation {
            screen = .second
        }
    }
    
    func screen2Done() {
        withAnimation {
            screen = .third
        }
    }
    
    func screen3Done() {
        withAnimation {
            screen = .first
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

extension Equatable {
    func isEqualTo<T: Equatable>(_ otherCondtruct: T) -> Bool {
        guard let thisConstruct = self as? T else {
            return false
        }
       
        return thisConstruct == otherCondtruct
    }
}
