//
//  Data.swift
//  Coordinator
//
//  Created by Farley Caesar on 2019-11-24.
//  Copyright © 2019 AppObject. All rights reserved.
//

import Foundation
import Combine

class Data: ObservableObject {
    var cancellableTimerSubscription: AnyCancellable? = nil
    @Published var food: [String] = []
    
    static let timerPublisherConnection =
        Timer.publish(every: 1.0, on: RunLoop.main, in: .common).autoconnect()
    
    init() {
        cancellableTimerSubscription = Data.timerPublisherConnection.sink { [weak self] _ in
            let numberOfItems = Int.random(in: 1..<10)
            self?.food = Array(repeating: "🥝 Yummy!", count: numberOfItems)
        }
    }
}
