//
//  ContentView.swift
//  PropertyList
//
//  Created by Kyle on 2023/12/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Demo")
            DemoView()
        }
        .environment(\.demo, "Demo2")
    }
}

struct DemoView: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let v = UILabel(frame: .zero)
        v.text = context.environment.demo
        return v
    }
    
    func updateUIView(_ v: UIViewType, context: Context) {
        v.text = context.environment.demo
        print(context.environment.description)
    }
}

private struct DemoKey: EnvironmentKey {
    static let defaultValue = "Demo"
}

extension EnvironmentValues {
    var demo: String {
        get { self[DemoKey.self] }
        set { self[DemoKey.self] = newValue }
    }
}

extension View {
    func demo(_ s: String) -> some View {
        environment(\.demo, s)
    }
}

#Preview {
    ContentView()
}
