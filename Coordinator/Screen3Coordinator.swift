//
//  Screen3Coordinator.swift
//  Coordinator
//
//  Created by Farley Caesar on 2019-11-24.
//  Copyright © 2019 AppObject. All rights reserved.
//

import Foundation
import SwiftUI

struct Screen3Coordinator: View {
    
    var done: () -> Void
    
    @EnvironmentObject private var data: Data

    var body: some View {
        Screen3(items: $data.food, done: self.done)
            .transition(.forwardScreenTransition)
    }
}
