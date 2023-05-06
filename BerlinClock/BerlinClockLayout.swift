//
//  BerlinClockLayout.swift
//  BerlinClock
//
//  Created by Dinmukhambet Turysbay on 11.04.2023.
//

import SwiftUI

struct BerlinClockLayout: View {
    @Binding var timeString: String
    @Binding var bool: Bool
    
    @State private var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isActive = true
    @Environment(\.scenePhase) var scenePhase

   var secondsLamp: LampColor {
       start(timeString: timeString).secondsLamp
   }
    
    var fiveHoursLamps: [LampColor]{
        start(timeString: timeString).fiveHoursLamps
    }
    
    var oneHourLamps: [LampColor]{
        start(timeString: timeString).oneHourLamps
    }
    
    var fiveMinutesLamps: [LampColor]{
        start(timeString: timeString).fiveMinutesLamps
    }
    
    var oneMinuteLamps: [LampColor]{
        start(timeString: timeString).oneMinuteLamps
    }
    
    var body: some View {
        VStack{
            ZStack{
                WhiteBackground()
                VStack(){
                    Circle()
                        .fill(.yellow)
                          .frame(width: 100, height: 50)
                          .padding(.bottom,16)
                          .opacity(bool ? (timeRemaining % 2 == 0 ? 1 : 0.3) : 0.3)
                    HStack(spacing: 14){
                        ForEach(fiveHoursLamps,id:\.self) { elem in
                            TimeBox(state:elem)
                        }
                    }
                    HStack(spacing: 14){
                        ForEach(oneHourLamps,id:\.self) { elem in
                            TimeBox(state:elem,color: .red)
                        }
                    }
                    HStack(spacing: 14){
                        ForEach(Array(fiveMinutesLamps.enumerated()),id:\.offset) { index,element in
                            Group{
                                if(index == 2 || index == 5 || index == 8){
                                    TimeBox(state:element)
                                }else{
                                    TimeBox(state:element,color: .yellow)
                                }
                            }
                        }
                    }
                    
                    HStack(spacing: 14){
                        ForEach(oneMinuteLamps,id:\.self) { elem in
                            TimeBox(state:elem,color:.yellow)
                        }
                    }
                }.padding(.horizontal,30)
                ZStack{
                    
                }
                    .onReceive(timer) { time in
                    guard isActive else { return }

                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }
            }
            Spacer()
        }
    }

}

struct BerlinClockLayout_Previews: PreviewProvider {
    static var previews: some View {
        BerlinClockLayout(timeString: .constant("16:59:00"),bool: .constant(false))
    }
}
