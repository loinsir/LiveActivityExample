//
//  ContentView.swift
//  LiveActivityExample
//
//  Created by 김인환 on 9/1/25.
//

import SwiftUI
import WidgetKit
import ActivityKit
import Combine

struct ContentView: View {
    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        VStack {
            requestActivity()
        }
        .onAppear {
            timer.sink { _ in
                Task {
                    do {
                        try await updateContentValue()
                    } catch {
                        print("Error updating content value: \(error.localizedDescription)")
                    }
                }
            }
            .store(in: &cancellables)
        }
    }
    
    private func requestActivity() -> some View {
        do {
            let attributes = SimpleAttributes(name: "My Activity")
            let initialContentState = SimpleAttributes.ContentState(value: 0)
            let activity = try Activity<SimpleAttributes>.request(
                attributes: attributes,
                content: .init(state: initialContentState, staleDate: Calendar.current.date(byAdding: .minute, value: 5, to: Date())),
                style: .standard
            )
            print("Requested a live activity \(activity.id)")
            return Text("Requested a live activity \(activity.id)")
        } catch (let error) {
            print("Error requesting live activity \(error.localizedDescription)")
            return Text("Error requesting live activity \(error.localizedDescription)")
        }
    }
    
    private func updateContentValue() async throws {
        for activity in Activity<SimpleAttributes>.activities {
            let updatedState = SimpleAttributes.ContentState(value: Int.random(in: 1...100))
            await activity.update(.init(state: updatedState, staleDate: Calendar.current.date(byAdding: .minute, value: 5, to: Date())))
            print("Updated live activity \(activity.id) to \(updatedState.value)")
        }
    }
}

#Preview {
    ContentView()
}
