//
//  Screen2.swift
//  Coordinator
//
//  Created by Farley Caesar on 2019-11-24.
//  Copyright © 2019 AppObject. All rights reserved.
//

import SwiftUI

struct Screen2: View {

    var done: () -> Void

    var body: some View {
        VStack {
            Text("Screen2").font(.title)
            Button(action: {
                self.done()
            }) {
                Text("Go to the tabs!")
            }
        }
    }
}

struct Screen2_Previews: PreviewProvider {
    static var previews: some View {
        Screen2(done: {})
    }
}
