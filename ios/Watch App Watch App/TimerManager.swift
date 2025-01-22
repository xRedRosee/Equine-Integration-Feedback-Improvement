//
//  TimerManager.swift
//  Runner
//
//  Created by ranim mohammad on 09/01/2025.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    @Published var elapsedTime: TimeInterval = 0
    @Published var isRunning = false
    @Published var currentTime: String = ""
    var timer: Timer?
    var clockTimer: Timer?

    init() {
        updateCurrentTime()
        startClock()
    }

    func start() {
        if !isRunning {
            isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.elapsedTime += 1
            }
        }
    }

    func pause() {
        isRunning = false
        timer?.invalidate()
    }

    func stop() {
        isRunning = false
        timer?.invalidate()
        elapsedTime = 0
    }

    func startClock() {
        clockTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.updateCurrentTime()
        }
    }

    func stopClock() {
        clockTimer?.invalidate()
    }

    func updateCurrentTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        currentTime = dateFormatter.string(from: Date())
    }

    func timeString() -> AttributedString {
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60

        var attributedString = AttributedString("")

        var minuteAttributes = AttributeContainer()
        minuteAttributes.font = .title2

        var labelAttributes = AttributeContainer()
        labelAttributes.font = .subheadline

        var secondAttributes = AttributeContainer()
        secondAttributes.font = .title2

        attributedString += AttributedString(String(format: "%02d", minutes),
                                             attributes: minuteAttributes)
        attributedString += AttributedString(" m ", attributes: labelAttributes)
        
        attributedString += AttributedString(String(format: "%02d", seconds),
                                             attributes: secondAttributes)
        attributedString += AttributedString(" s", attributes: labelAttributes)

        return attributedString
    }
}
