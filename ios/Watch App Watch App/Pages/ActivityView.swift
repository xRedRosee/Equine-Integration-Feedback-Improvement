//
//  ActivityView.swift
//  Runner
//
//  Created by ranim mohammad on 09/01/2025.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var timerManager: TimerManager

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 30) {
                Button(action: {
                    timerManager.stop()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(AppColors.red)
                }
                .buttonStyle(PlainButtonStyle())
                
                if timerManager.isRunning {
                    Button(action: {
                        timerManager.pause()
                    }) {
                        Image(systemName: "pause.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(AppColors.yellow)
                    }
                    .buttonStyle(PlainButtonStyle())
                } else {
                    Button(action: {
                        timerManager.start()
                    }) {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(AppColors.green)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }

        }
    }
}

#Preview {
    ContentView()
}
