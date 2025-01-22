//
//  EquineWidget.swift
//  EquineWidget
//
//  Created by Iris Roemermann on 10/01/2025.
//

import WidgetKit
import SwiftUI
import Charts

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), horseName: "Timmy", feeling: "happy",recordingStatus: true, intensity: "low", target: 4, progress: 3, leaderboardPercentage: 0.6)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), horseName: "Timmy", feeling: "happy", recordingStatus: true, intensity: "low", target: 4, progress: 3, leaderboardPercentage: 0.6)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, horseName: "Timmy",feeling: "happy", recordingStatus: true, intensity: "low", target: 4, progress: 3, leaderboardPercentage: 0.6)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let horseName: String
    let feeling: String
    let recordingStatus: Bool
    let intensity: String?
    let target: Int
    let progress: Int
    let leaderboardPercentage: Double
}

struct EquineWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        if widgetFamily == .systemSmall {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center){
                    if entry.feeling == "happy" {
                        Image("HappyImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    } else {
                        Image("SadImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Text(entry.horseName)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.thunderBlue)
                }
                .padding(.bottom, 2)
            }
            
            VStack(alignment: .center){
                if entry.recordingStatus {
                    // If recording went well
                    VStack(alignment: .center){
                        Image("SuccessImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Text("Recording succesfull")
                            .font(.system(size: 11))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.bottom, 2)
                            .multilineTextAlignment(.center)
                        Text("Click to view training recap.")
                            .font(.system(size: 11))
                            .foregroundColor(.white)
                            .padding(.bottom, 3)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(Color("Green"))
                    .cornerRadius(4)
                    
                } else {
                    // If recording went wrong
                    VStack(alignment: .center){
                        Image("ErrorImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.top, 2)
                        Text("Recording went wrong")
                            .font(.system(size: 11))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.white)
                            .padding(.bottom, 2)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color("Red"))
                    .cornerRadius(4)
                    .padding(.bottom, 2)
                    
                    Text("Tips for improvement:")
                        .font(.system(size: 11))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("DarkGray"))
                    
                    HStack(alignment: .center){
                        Circle()
                            .frame(width: 11, height: 11)
                            .overlay(
                                Circle().stroke(Color("BrightBlue"), lineWidth: 1)
                                
                            )
                            .foregroundColor(Color.white)
                        Text("Phone left pocket")
                            .font(.system(size: 11))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("ThunderBlue"))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack(alignment: .center){
                        Circle()
                            .frame(width: 11, height: 11)
                            .overlay(
                                Circle().stroke(Color("BrightBlue"), lineWidth: 1)
                            )
                            .foregroundColor(Color.white)
                        Text("Bluetooth connected")
                            .font(.system(size: 11))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("ThunderBlue"))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        } else if widgetFamily == .systemMedium {
            HStack() {
                HStack(alignment: .center){
                    if entry.feeling == "happy" {
                        Image("HappyImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    } else {
                        Image("SadImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Text(entry.horseName)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("ThunderBlue"))
                    Spacer()
                }
                .padding(.bottom, 2)
                .frame(maxWidth: .infinity, alignment: .trailing)
                        
                HStack(){
                    Image("LeaderboardImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Text(String(format: "Top %.0f%%", entry.leaderboardPercentage * 100))
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(Color("DarkGray"))
                }
                .padding(.bottom, 2)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .frame(maxWidth: .infinity)
            
            HStack(alignment: .top){
                // Left side
                VStack(){

                    VStack(alignment: .center){
                        if entry.recordingStatus {
                            // If recording went well
                            VStack(alignment: .center){
                                Image("SuccessImage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 12, height: 12)
                                    .padding(.top, 2)
                                Text("Recording succesfull")
                                    .font(.system(size: 11))
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                Text("Click to view training recap.")
                                    .font(.system(size: 10))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 3)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("Green"))
                            .cornerRadius(4)
                            
                            Text("Training intensity")
                                .font(.system(size: 15))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color("DarkGray"))
                           
                            
                            
                            if let intensity = entry.intensity {
                                HStack(alignment: .top) {
                                    Image(intensity == "low" ? "LowIntensityImage" : intensity == "medium" ? "MediumIntensityImage" : "HighIntensityImage")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 26, height: 26)

                                    Text("\(intensity.capitalized) intensity means \(intensity == "low" ? "less chance of injuries." : intensity == "medium" ? "moderate chance of injuries." : "higher chance of injuries.")")
                                        .font(.system(size: 10))
                                        .foregroundColor(Color("ThunderBlue"))
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            
                        } else {
                            // If recording went wrong
                            VStack(alignment: .center){
                                Image("ErrorImage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 12, height: 12)
                                    .padding(.top, 2)
                                Text("Recording went wrong")
                                    .font(.system(size: 11))
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                Text("There is no or incorrect data.")
                                    .font(.system(size: 10))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 3)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("Red"))
                            .cornerRadius(4)
                            .padding(.bottom, 2)
                            
                            Text("Tips for improvement:")
                                .font(.system(size: 11))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color("DarkGray"))
                            
                            HStack(alignment: .center){
                                Circle()
                                    .frame(width: 11, height: 11)
                                    .overlay(
                                        Circle().stroke(Color("BrightBlue"), lineWidth: 1)
                                        
                                    )
                                    .foregroundColor(Color.white)
                                Text("Phone left pocket")
                                    .font(.system(size: 11))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color("ThunderBlue"))
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                            HStack(alignment: .center){
                                Circle()
                                    .frame(width: 11, height: 11)
                                    .overlay(
                                        Circle().stroke(Color("BrightBlue"), lineWidth: 1)
                                    )
                                    .foregroundColor(Color.white)
                                Text("Bluetooth connected")
                                    .font(.system(size: 11))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color("ThunderBlue"))
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                }
                
                // Divider
                Rectangle()
                        .frame(width: 1)
                        .foregroundColor(Color("DividerGray"))
                
                // Right side
                VStack(alignment: .center){
                    Text("Weekly progress")
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color("DarkGray"))
                        .fontWeight(.medium)
                    
                    ZStack(alignment: .center){
                        Chart {
                            SectorMark(
                                angle: .value("Progress", entry.progress),
                                innerRadius: .ratio(0.8)
                            )
                            .foregroundStyle(Color("BrightGreen"))
                            
                            SectorMark(
                                angle: .value("Remaining", entry.target - entry.progress),
                                innerRadius: .ratio(0.8)
                            )
                            .foregroundStyle(Color.gray.opacity(0.3))
                        }
                        .frame(width: 80, height: 80)
                        
                        VStack(alignment: .center){
                            Text("recorded \ntrainings")
                                .font(.system(size: 11))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)

                            Text("\(Int(entry.progress))/\(Int(entry.target))")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        
                    }}
                .frame(maxWidth: .infinity, alignment: .center)
                    
            }
        }
    }
}

struct EquineWidget: Widget {
    let kind: String = "EquineWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                EquineWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                EquineWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Equine Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])

    }
}

#Preview(as: .systemSmall) {
    EquineWidget()
} timeline: {
    SimpleEntry(date: .now, horseName: "Timmy", feeling: "happy", recordingStatus: true, intensity: "high", target: 5, progress: 3, leaderboardPercentage: 0.06)
    SimpleEntry(date: .now, horseName: "Timmy", feeling: "sad", recordingStatus: false, intensity: nil, target: 4, progress: 2, leaderboardPercentage: 0.6)
}
