//
//  Screen1.swift
//  Coordinator
//
//  Created by Farley Caesar on 2019-11-24.
//  Copyright © 2019 AppObject. All rights reserved.
//

import SwiftUI

struct Screen1: View {
    var done: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Home Screen")
                .font(.largeTitle)
            
            Spacer()
            
            Button(action: done) {
                VStack {
                    Text("✨Go✨")
                        .multilineTextAlignment(.center)
                    Image(systemName: "tornado")
                }.font(.largeTitle)
            }
            
            Spacer()
        }
    }
}

struct Screen1_Previews: PreviewProvider {
    static var previews: some View {
        Screen1(done: { print("Screen 1 Done!")})
    }
}
