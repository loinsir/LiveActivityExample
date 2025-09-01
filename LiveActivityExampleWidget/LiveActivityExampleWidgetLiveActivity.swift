//
//  LiveActivityExampleWidgetLiveActivity.swift
//  LiveActivityExampleWidget
//
//  Created by 김인환 on 9/1/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LiveActivityExampleWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SimpleAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.attributes.name)")
                Text("Time: \(context.state.value)")
            }
            .activityBackgroundTint(Color.mint)
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
                    Text("Bottom \(context.state.value)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.value)")
            } minimal: {
                Text("Minimal \(context.state.value)")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension SimpleAttributes {
    fileprivate static var preview: SimpleAttributes {
        SimpleAttributes(name: "Preview")
    }
}

#Preview("Notification", as: .content, using: SimpleAttributes.preview) {
   LiveActivityExampleWidgetLiveActivity()
} contentStates: {
    SimpleAttributes.ContentState(value: 10)
}
