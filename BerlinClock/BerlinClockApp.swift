//
//  BerlinClockApp.swift
//  BerlinClock
//
//  Created by Dinmukhambet Turysbay on 11.04.2023.
//

import SwiftUI

@main
struct BerlinClockApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


//struct ContentView: View {
//    @State var selectedDate = Date()
//    @State var selectedDate2 = Date()
//    @State var isUserInput = false
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    private var formattedSelectedDate: String {
//            let formatter = DateFormatter()
//            formatter.dateFormat = "HH:mm:ss"
//            return formatter.string(from: selectedDate)
//    }
//    var body: some View {
//        VStack(spacing: 30){
//            Text("Time is \(formattedSelectedDate)")
//                .font(.title2)
//                .fontWeight(.semibold)
////                .onReceive(timer) { input in
////                               input = selectedDate
////                           }
//            BerlinClockView(time: selectedDate)
//                .padding([.leading,.trailing],16)
//                .frame(height: 312)
//            ZStack{
//                RoundedRectangle(cornerRadius: 16)
//                    .foregroundColor(.white)
//                DatePicker(
//                    "Insert time",
//                    selection: $selectedDate,
//                    displayedComponents: [.hourAndMinute]
//                )
////                .onChange(of: selectedDate, perform: { value in
////                    isUserInput = true
////                })
//                .padding([.leading,.trailing],16)
//            }
//            .padding([.leading,.trailing],16)
//            .frame(height: 52)
//        }
//        .frame(maxHeight: .infinity)
//        .padding(.bottom,200)
//        .edgesIgnoringSafeArea(.all)
//        .background(Color(red: 242/255, green: 242/255, blue: 238/255))
//        .environment(\.locale,Locale(identifier: "ru_Ru"))
//        
//        .onReceive(timer) { _ in
//            let currentSeconds = Calendar.current.component(.second, from: selectedDate)
//            if currentSeconds == 59 {
//                selectedDate.addTimeInterval(1)
//                selectedDate = roundDateToMinute(selectedDate)
//            } else {
//                selectedDate.addTimeInterval(1)
//            }
//        }
//    }
//           
//           private func roundDateToMinute(_ date: Date) -> Date {
//               let calendar = Calendar.current
//               let minute = calendar.component(.minute, from: date)
//               let roundedDate = calendar.date(bySetting: .second, value: 0, of: date)!
//               return calendar.date(bySetting: .minute, value: minute, of: roundedDate)!
//           }
//}
//
//
//struct BerlinClockView: View {
//    let time: Date
//    let calendar = Calendar.current
//    
//    private func getSeconds(_ time: Date) -> Int {
//        calendar.component(.second, from: time)
//    }
//    
//    private func getTopHours(_ time: Date) -> Int {
//        calendar.component(.hour, from: time) / 5
//    }
//    
//    private func getBottomHours(_ time: Date) -> Int {
//        calendar.component(.hour, from: time) % 5
//    }
//    
//    private func getTopMinutes(_ time: Date) -> Int {
//        calendar.component(.minute, from: time) / 5
//    }
//    
//    private func getBottomMinutes(_ time: Date) -> Int {
//        calendar.component(.minute, from: time) % 5
//    }
//    
//    var body: some View {
//        ZStack{
//            RoundedRectangle(cornerRadius: 16)
//                .foregroundColor(.white)
//            VStack(spacing: 16){
//                RoundedRectangle(cornerRadius: 28)
//                    .frame(width: 56, height: 56)
//                    .foregroundColor(getSeconds(time) % 2 == 0 ? .yellow : .gray)
//                HStack(spacing: 4) {
//                    ForEach(0..<4) { index in
//                        RoundedRectangle(cornerRadius: 4)
//                            .frame(height: 32)
//                            .foregroundColor(index < getTopHours(time) ? .red : .gray)
//                    }
//                }
//                HStack(spacing: 4) {
//                    ForEach(0..<4) { index in
//                        RoundedRectangle(cornerRadius: 4)
//                            .frame(height: 32)
//                            .foregroundColor(index < getBottomHours(time) ? .red : .gray)
//                    }
//                }
//                HStack(spacing: 4) {
//                    ForEach(0..<11) { index in
//                        RoundedRectangle(cornerRadius: 4)
//                            .frame(height: 32)
//                            .foregroundColor(index < getTopMinutes(time) ? (index+1) % 3 == 0 ? .red : .yellow : .gray)
//                    }
//                }
//                HStack(spacing: 4) {
//                    ForEach(0..<4) { index in
//                        RoundedRectangle(cornerRadius: 4)
//                            .frame( height: 32)
//                            .foregroundColor(index < getBottomMinutes(time) ? .yellow : .gray)
//                    }
//                }
//            }
//            .frame(height: 312)
//            .padding([.leading,.trailing],16)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
