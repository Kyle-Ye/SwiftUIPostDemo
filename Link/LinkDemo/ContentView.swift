//
//  ContentView.swift
//  LinkDemo
//
//  Created by Kyle on 2023/11/28.
//

import SwiftUI
@testable import struct OpenSwiftUI.Link
import struct OpenSwiftUI.EmptyView
import struct OpenSwiftUI.Text

struct ContentView: View {
    @Environment(\.openURL) var openURL
    @Environment(\._openSensitiveURL) var openSensitiveURL
    private var sensitiveURL = URL(string: "prefs:root=Privacy&path=contacts")!

    var link: some View {
        var link = SwiftUI.Link(destination: sensitiveURL) {
            SwiftUI.Text("Example")
        }
        withUnsafeMutablePointer(to: &link) { pointer in
            let linkPointer = UnsafeMutableRawPointer(pointer).assumingMemoryBound(to: OpenSwiftUI.Link<OpenSwiftUI.Text>.self)
            let isSensitivePointer = linkPointer.pointer(to: \.destination.configuration.isSensitive)!
            isSensitivePointer.pointee = true
        }
        return link
    }

    var body: some View {
        VStack {
            SwiftUI.Link("normal SwiftUI Link", destination: sensitiveURL)
            SwiftUI.Link("SwiftUI Link with isSensitive to true", sensitiveDestination: sensitiveURL)
            Button("openSensitiveURL Button") {
                openSensitiveURL(sensitiveURL)
            }
        }
    }
}

extension SwiftUI.Link where Label == SwiftUI.Text {
    public init(_ titleKey: LocalizedStringKey, sensitiveDestination: URL) {
        self.init(titleKey, destination: sensitiveDestination)
        withUnsafeMutablePointer(to: &self) { pointer in
            let linkPointer = UnsafeMutableRawPointer(pointer).assumingMemoryBound(to: OpenSwiftUI.Link<OpenSwiftUI.Text>.self)
            let isSensitivePointer = linkPointer.pointer(to: \.destination.configuration.isSensitive)!
            isSensitivePointer.pointee = true
        }
    }
}

#Preview {
    ContentView()
}
