//
//  BerlinClockLogic.swift
//  BerlinClock
//
//  Created by Dinmukhambet Turysbay on 11.04.2023.
//

import Foundation

enum LampColor {
    case off
    case red
    case yellow
}

struct BerlinClock{
    var secondsLamp: LampColor
    var fiveHoursLamps: [LampColor]
    var oneHourLamps: [LampColor]
    var fiveMinutesLamps: [LampColor]
    var oneMinuteLamps: [LampColor]

    init() {
        secondsLamp = .off
        fiveHoursLamps = [.off, .off, .off, .off]
        oneHourLamps = [.off, .off, .off, .off]
        fiveMinutesLamps = [.off, .off, .off, .off, .off, .off, .off, .off, .off, .off, .off]
        oneMinuteLamps = [.off, .off, .off, .off]
    }
}

func updateBerlinClock(_ clock: inout BerlinClock, _ time: (hours: Int, minutes: Int, seconds: Int)) -> BerlinClock{
    clock.secondsLamp = time.seconds % 2 == 0 ? .yellow : .off

    let fiveHours = time.hours / 5
    for i in 0..<fiveHours {
        clock.fiveHoursLamps[i] = .red
    }
    
    let oneHour = time.hours % 5
    for i in 0..<oneHour {
        clock.oneHourLamps[i] = .red
    }

    let fiveMinutes = time.minutes / 5
    for i in 0..<fiveMinutes {
        if i == 2 || i == 5 || i == 8 {
            clock.fiveMinutesLamps[i] = .red
        } else {
            clock.fiveMinutesLamps[i] = .yellow
        }
    }

    let oneMinute = time.minutes % 5
    for i in 0..<oneMinute {
        clock.oneMinuteLamps[i] = .yellow
    }
    return clock
}

func start(timeString: String) -> BerlinClock {
    let timeComponents: [Int] = timeString.split(separator: ":").compactMap({Int($0)})
        var clock = BerlinClock()
        clock = updateBerlinClock(&clock, (hours: timeComponents[0], minutes: timeComponents[1], seconds: timeComponents[2]))
        return clock
}
