//
//  RecordingView.swift
//  Runner
//
//  Created by ranim mohammad on 09/01/2025.
//

import SwiftUI

struct RecordingView: View {
    @ObservedObject var timerManager: TimerManager

    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 25) {
                // snelheid
                VStack() {
                    Image("speed")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                        .foregroundColor(AppColors.yellow)
                    Text("20")
                        .font(.largeTitle)
                        .foregroundColor(AppColors.yellow)
                    Text("mph")
                        .font(.callout)
                        .foregroundColor(AppColors.yellow80)
                }
                // hartslag
                VStack() {
                    Image("Heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 45)
                        .foregroundColor(AppColors.red)
                    Text("80")
                        .font(.largeTitle)
                        .foregroundColor(AppColors.red)
                    Text("bpm")
                        .font(.callout)
                        .foregroundColor(AppColors.red80)
                }
            }
            VStack(spacing: 1) {
                // countdown
                Text(timerManager.timeString())
                    .foregroundColor(AppColors.lightBlue)
                // klok
                Text(timerManager.currentTime)
                    .font(.title3)
                    .foregroundColor(AppColors.lightBlue)
            }

        }
    }
}

#Preview {
    ContentView()
}
