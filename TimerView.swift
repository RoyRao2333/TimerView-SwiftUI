//
//  ContentView.swift
//  WWDC_raw
//
//  Created by Roy Rao on 2021/4/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        MainViewController()
        TimerView()
            .frame(width: 350, height: 200)
    }
}

struct TimerFace: Shape {
    func path(in rect: CGRect) -> Path {
        var facePath = Path()
        facePath.move(to: CGPoint(x: 50, y: 100))
        facePath.addCurve(to: CGPoint(x: 100, y: 50), control1: CGPoint(x: 77.61, y: 100), control2: CGPoint(x: 100, y: 77.61))
        facePath.addCurve(to: CGPoint(x: 50.05, y: 0), control1: CGPoint(x: 100, y: 22.44), control2: CGPoint(x: 77.66, y: 0))
        facePath.addCurve(to: CGPoint(x: 44.74, y: 5.12), control1: CGPoint(x: 46.75, y: 0), control2: CGPoint(x: 44.74, y: 1.96))
        facePath.addLine(to: CGPoint(x: 44.74, y: 22.01))
        facePath.addCurve(to: CGPoint(x: 49.38, y: 26.79), control1: CGPoint(x: 44.74, y: 24.74), control2: CGPoint(x: 46.65, y: 26.79))
        facePath.addCurve(to: CGPoint(x: 54.02, y: 22.01), control1: CGPoint(x: 52.11, y: 26.79), control2: CGPoint(x: 54.02, y: 24.74))
        facePath.addLine(to: CGPoint(x: 54.02, y: 11.24))
        facePath.addCurve(to: CGPoint(x: 88.76, y: 50), control1: CGPoint(x: 73.68, y: 13.3), control2: CGPoint(x: 88.76, y: 29.81))
        facePath.addCurve(to: CGPoint(x: 50, y: 88.8), control1: CGPoint(x: 88.76, y: 71.44), control2: CGPoint(x: 71.58, y: 88.8))
        facePath.addCurve(to: CGPoint(x: 11.24, y: 50), control1: CGPoint(x: 28.47, y: 88.8), control2: CGPoint(x: 11.2, y: 71.44))
        facePath.addCurve(to: CGPoint(x: 19.62, y: 26.08), control1: CGPoint(x: 11.29, y: 41.05), control2: CGPoint(x: 14.4, y: 32.63))
        facePath.addCurve(to: CGPoint(x: 19.67, y: 17.8), control1: CGPoint(x: 21.67, y: 23.06), control2: CGPoint(x: 22.11, y: 20.19))
        facePath.addCurve(to: CGPoint(x: 11, y: 19.04), control1: CGPoint(x: 17.32, y: 15.5), control2: CGPoint(x: 13.44, y: 15.74))
        facePath.addCurve(to: CGPoint(x: 0, y: 50), control1: CGPoint(x: 4.16, y: 27.56), control2: CGPoint(x: 0, y: 38.37))
        facePath.addCurve(to: CGPoint(x: 50, y: 100), control1: CGPoint(x: 0, y: 77.61), control2: CGPoint(x: 22.39, y: 100))
        return facePath
    }
}

struct TimerHand: Shape {
    var degree : Double

    func path(in rect: CGRect) -> Path {
        var handPath = Path()
        handPath.move(to: CGPoint(x: 7.93, y: 40))
        handPath.addCurve(to: CGPoint(x: 15.8, y: 29.75), control1: CGPoint(x: 13.5, y: 39.9), control2: CGPoint(x: 16.88, y: 35.25))
        handPath.addLine(to: CGPoint(x: 10.76, y: 2.77))
        handPath.addCurve(to: CGPoint(x: 5.22, y: 2.77), control1: CGPoint(x: 10.03, y: -0.92), control2: CGPoint(x: 5.95, y: -0.92))
        handPath.addLine(to: CGPoint(x: 0.21, y: 29.72))
        handPath.addCurve(to: CGPoint(x: 7.93, y: 40), control1: CGPoint(x: -0.9, y: 35.25), control2: CGPoint(x: 2.44, y: 39.93))
        return handPath.rotation(.degrees(degree), anchor: .center).path(in: rect)
    }
}

struct TimerView: View {
    @State private var rotation = 0.0

    var body: some View {
        VStack {
            ZStack {
                TimerFace().frame(width: 100,height: 100, alignment: .center)
                TimerHand(degree: rotation).frame(width: 16, height: 64, alignment: .center)
            }
            Slider(
                value: $rotation,
                in: 0.0 ... 360
            ) {
                Text("along rotaion")
            }
            .padding()
        }
    }
}
