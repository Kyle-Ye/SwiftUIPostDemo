//
//  DemoSliderStyle.swift
//  SliderDemo
//
//  Created by Kyle on 2023/12/3.
//

import Foundation
import SwiftUI

struct DemoSliderStyle: SliderStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            HStack {
                Text("Label:")
                configuration.label
            }
            HStack {
                Text("MaximumValueLabel:")
                configuration.maximumValueLabel
            }
            HStack {
                Text("MinimumValueLabel:")
                configuration.minimumValueLabel
            }
            Slider(value: configuration.$value)
            Button("Trigger onEditingChanged false") {
                configuration.onEditingChanged(false)
            }
            Button("Trigger onEditingChanged true") {
                configuration.onEditingChanged(true)
            }
        }
    }
}
