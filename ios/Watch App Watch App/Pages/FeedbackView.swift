//
//  FeedbackView.swift
//  Runner
//
//  Created by ranim mohammad on 09/01/2025.
//

import SwiftUI

struct FeedbackView: View {
    var body: some View {
        ZStack{
            AppColors.red.ignoresSafeArea()
            VStack(spacing: 10) {
                Spacer()
                Text("Warning")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                Image("hand")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                Spacer()
                Text(" Intensity too high ")
                    .multilineTextAlignment(.center)
                    .font(.callout)
                    .foregroundColor(.white)
                Spacer()
            }
            
        }
    }
}

#Preview {
    FeedbackView()
}
