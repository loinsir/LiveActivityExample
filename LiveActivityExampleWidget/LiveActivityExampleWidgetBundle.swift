//
//  LiveActivityExampleWidgetBundle.swift
//  LiveActivityExampleWidget
//
//  Created by 김인환 on 9/1/25.
//

import WidgetKit
import SwiftUI

@main
struct LiveActivityExampleWidgetBundle: WidgetBundle {
    var body: some Widget {
        LiveActivityExampleWidget()
        LiveActivityExampleWidgetLiveActivity()
    }
}
