//
//  LiveActivityExampleWidgetLiveActivity.swift
//  LiveActivityExampleWidget
//
//  Created by 김인환 on 9/1/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LiveActivityExampleWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct LiveActivityExampleWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveActivityExampleWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension LiveActivityExampleWidgetAttributes {
    fileprivate static var preview: LiveActivityExampleWidgetAttributes {
        LiveActivityExampleWidgetAttributes(name: "World")
    }
}

extension LiveActivityExampleWidgetAttributes.ContentState {
    fileprivate static var smiley: LiveActivityExampleWidgetAttributes.ContentState {
        LiveActivityExampleWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: LiveActivityExampleWidgetAttributes.ContentState {
         LiveActivityExampleWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: LiveActivityExampleWidgetAttributes.preview) {
   LiveActivityExampleWidgetLiveActivity()
} contentStates: {
    LiveActivityExampleWidgetAttributes.ContentState.smiley
    LiveActivityExampleWidgetAttributes.ContentState.starEyes
}
