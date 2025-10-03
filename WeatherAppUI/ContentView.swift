//
//  ContentView.swift
//  WeatherAppUI
//
//  Created by Luke Kelly on 9/30/25.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("top_blue"), Color("bottom_blue"), ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(edges: .all)
            VStack {
                Text("Beech Mountain")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                Text("58°")
                    .foregroundStyle(.white)
                    .font(.system(size: 90))
                    .fontWeight(.thin)
                    .padding(.bottom)
                Text("Sunny")
                    .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                    .font(.title)
                Text("H:69°   L:44°")
                    .foregroundStyle(.white)
                    .font(.system(size: 25))
                    .padding(.bottom)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color("back_blue"))
                        .frame(width: 380, height: 150)
                    
                    VStack {
                        HStack {
                            Image(systemName: "clock")
                                .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                                .padding(.leading, 25)
                                .fontWeight(.medium)
                            Text("HOURLY FORECAST")
                                .foregroundColor(Color(red: 0.89, green: 0.89, blue: 0.89))
                                .fontWeight(.medium)
                            Spacer()
                        }
                        HStack {
                            HourDisplay(time: "Now", icon: "sun.max.fill", temp: "59°")
                            HourDisplay(time: "11AM", icon: "sun.max.fill", temp: "61°")
                            HourDisplay(time: "12PM", icon: "sun.max.fill", temp: "64°")
                            HourDisplay(time: "1PM", icon: "sun.max.fill", temp: "66°")
                            HourDisplay(time: "2PM", icon: "sun.max.fill", temp: "69°")
                        }
                    }
                }
                DayDisplay(day: "Sat", low: 44, high: 69, icon: "sun.max.fill")
            }
        }
    }
    
}

struct HourDisplay: View {
    var time: String
    var icon: String
    var temp: String
    
    var body: some View {
        VStack {
            Text(time)
                .padding(.bottom, 2)
                .foregroundColor(.white)
                .fontWeight(.bold)
            Image(systemName: icon)
                .font(.system(size: 30))
                .padding(.bottom, 2)
                .foregroundColor(.yellow)
                
            Text(temp)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .padding(.trailing, 8)
        .padding(.leading, 8)
        .padding(.top, 2)
    }
}
struct DayDisplay: View {
    var day: String
    var low: Int
    var high: Int
    var icon: String
    
    var body: some View {
        HStack {
            Text(day)
            Image(systemName: icon)
                .foregroundStyle(.yellow)
            Text(String(low)+"°")
            TemperatureGraph(high: high, low: low)
            Text(String(high)+"°")
        }
    }
}
struct TemperatureGraph: View {
    var high: Int
    var low: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 100, height: 7)
                .foregroundStyle(Color("graph_base"))
            RoundedRectangle(cornerRadius: 5)
                .frame(width: CGFloat(high-low), height: 7)
                .foregroundStyle(Color("graph_front"))
                .padding(.leading, CGFloat(high/3))
        }
    }
}


#Preview {
    ContentView()
}
