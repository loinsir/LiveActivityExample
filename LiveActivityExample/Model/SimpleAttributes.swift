//
//  SimpleAttributes.swift
//  LiveActivityExample
//
//  Created by 김인환 on 9/1/25.
//

import Foundation
import ActivityKit

struct SimpleAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}
