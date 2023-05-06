//
//  Components.swift
//  BerlinClock
//
//  Created by Dinmukhambet Turysbay on 11.04.2023.
//

import SwiftUI

struct TimeBox: View{
    let state: LampColor
    let color: Color
    
    init(state: LampColor = .off,color: Color = .red) {
        self.state = state
        self.color = color
    }
   
    var body: some View{
        Rectangle()
            .fill(color)
            .frame(height: 32)
            .cornerRadius(5)
            .opacity(state != .off ? 1 : 0.3)
    }
}

struct WhiteBackground: View{
    var body: some View{
        RoundedRectangle(cornerRadius: 25, style: .continuous)
                       .fill(.white)
                       .frame(height: 312)
                       .padding()
                       .shadow(radius: 10)
    }
}
