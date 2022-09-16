//
//  StopwatchAttributes.swift
//  TestLiveActivity
//
//  Created by Jimmy Li on 2022/9/16.
//

import ActivityKit
import Foundation

struct StopwatchAttributes: ActivityAttributes {
    public typealias StopwatchStatus = ContentState

    public struct ContentState: Codable, Hashable {
        var startTime: Date
    }

    var name: String
}
