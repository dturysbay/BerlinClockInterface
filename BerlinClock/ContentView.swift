//
//  ContentView.swift
//  BerlinClock
//
//  Created by Dinmukhambet Turysbay on 11.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State var date = Calendar.current.nextDate(after: Date(), matching: .init(hour: 8), matchingPolicy: .strict)!
    @State var timeString = "00:00:00"
    @State var bool = false
    
    private func formatTime() {
        var timeFormatter : DateFormatter {
            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.locale = Locale(identifier: "ru_RU")
            return formatter
        }
        timeString = timeFormatter.string(from: date)
    }
    
    var body: some View {
        VStack{
            BerlinClockLayout(timeString: $timeString,bool: $bool)
            Form {
                HStack{
                    Text("Insert time")
                    Spacer()
                    DatePicker("", selection: $date, displayedComponents: .hourAndMinute)
                        .onChange(of: date, perform: { value in
                            formatTime()
                            bool = true
                        })
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
