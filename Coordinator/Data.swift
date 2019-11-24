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
    @Published var food: [String] = []
}
