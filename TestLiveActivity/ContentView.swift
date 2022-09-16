//
//  ContentView.swift
//  TestLiveActivity
//
//  Created by Jimmy Li on 2022/9/16.
//

import ActivityKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Stopwatch")
            Button("Start") {
                startStopwatch()
            }
            Button("Stop") {
                stopStopwatch()
            }
        }
    }

    private func startStopwatch() {
        do {
            let activity = try Activity<StopwatchAttributes>.request(
                attributes: StopwatchAttributes(name: "🚀 Commute to Client"),
                contentState: StopwatchAttributes.ContentState(startTime: Date())
            )
        } catch {
            print(error)
        }
    }

    private func stopStopwatch() {
        Task {
            for activity in Activity<StopwatchAttributes>.activities {
                await activity.end(dismissalPolicy: .immediate)
            }
        }
    }
}
