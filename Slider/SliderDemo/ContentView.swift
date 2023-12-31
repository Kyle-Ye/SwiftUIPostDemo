//
//  ContentView.swift
//  SliderDemo
//
//  Created by Kyle on 2023/12/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            slider
                .border(Color.red, width: 1)
            Divider().padding()
            slider
                .sliderStyle(DemoSliderStyle())
                .border(Color.green, width: 1)
        }
    }
    
    @State private var value = 20.0
    
    private var slider: some View {
        Slider(value: $value,
               in: 0.0 ... 100.0,
               step: 0.5) {
            Text("Hello")
        } minimumValueLabel: {
            Image(systemName: "light.min")
        } maximumValueLabel: {
            Image(systemName: "light.max")
        } onEditingChanged: { start in
            if start {
                print("\(value) start")
            } else {
                print("\(value) end")
            }
        }
    }
}

#Preview {
    ContentView()
}
