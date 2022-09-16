//
//  WidgetDemo.swift
//  WidgetDemo
//
//  Created by Jimmy Li on 2022/9/16.
//

import WidgetKit
import SwiftUI

@main
struct Widgets: WidgetBundle {
    var body: some Widget {
        StopwatchActivityWidget()
    }
}

struct StopwatchActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: StopwatchAttributes.self) { context in
            HStack {
                Image("pro_logo")
                    .resizable()
                    .frame(width: 64, height: 64)

                VStack(alignment: .leading) {
                    Text(context.attributes.name)
                        .font(.headline)

                    Text(timerInterval: context.state.timeInterval, countsDown: false)
                        .monospacedDigit()
                        .font(.footnote)
                }
            }
        } dynamicIsland: { context in
            DynamicIsland(
                expanded: {
                    DynamicIslandExpandedRegion(.leading) {
                        Image("pro_logo")
                            .resizable()
                            .frame(width: 64, height: 64)
                    }

                    DynamicIslandExpandedRegion(.trailing) {
                        Text(timerInterval: context.state.timeInterval, countsDown: false)
                            .frame(width: 40)
                            .monospacedDigit()
                            .font(.footnote)
                    }

                    DynamicIslandExpandedRegion(.center) {
                        Text(context.attributes.name)
                    }

                    DynamicIslandExpandedRegion(.bottom) {
                        Text("Goto Stopwatch")
                    }
                },
                compactLeading: {
                    Image("pro_logo")
                        .resizable()
                        .frame(width: 24, height: 24)
                },
                compactTrailing: {
                    Text(timerInterval: context.state.timeInterval, countsDown: false)
                        .frame(width: 40)
                        .monospacedDigit()
                        .font(.footnote)
                },
                minimal: {
                    Text("WHERE IS THIS?")
                }
            )
        }
    }
}

private extension StopwatchAttributes.ContentState {
    var timeInterval: ClosedRange<Date> {
        // TODO: there is a maximum time this widget remain visible!
        // After that, system will kill this widget
        startTime ... startTime.addingTimeInterval(TimeInterval(24 * 60 * 60)) // 24 hours
    }
}
