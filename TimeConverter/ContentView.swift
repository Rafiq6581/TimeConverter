//
//  ContentView.swift
//  TimeConverter
//
//  Created by Rafiq Rifhan Rosman on 2024/07/11.
//

import SwiftUI

struct ContentView: View {
    @State private var timeInput = 60.0
    @State private var inputUnit = "seconds"
    @State private var outputUnit = "minutes"
    @FocusState private var isInputFieldFocused: Bool
    
    let inputUnits = ["seconds", "minutes", "hours", "days"]
    let outputUnits = ["seconds", "minutes", "hours", "days"]
    
    var secondConverted: Double {
        let inputValue = timeInput
        let fromUnit = inputUnit
        
        switch fromUnit {
        case "minutes":
            return timeInput * 60
        case "hours":
            return timeInput * 60 * 60
        case "days":
            return timeInput * 24 * 60 * 60
        default:
            return timeInput
        }
    }
    
    var finalConverted: Double {
        let secondsValue = secondConverted
        let toUnit = outputUnit
        
        switch toUnit {
        case "minutes":
            return secondsValue / 60
        case "hours":
            return secondsValue / 60 / 60
        case "days":
            return secondsValue / 24 / 60 / 60
        default:
            return secondsValue
        }
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("time to be converted") {
                    TextField("Input value", value: $timeInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isInputFieldFocused)
                    
                    Picker("choose a unit", selection: $inputUnit) {
                        ForEach(inputUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("converted time") {
                    Picker("choose a unit", selection: $outputUnit) {
                        ForEach(outputUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(finalConverted.formatted())
                }
            }
            .navigationTitle("TimeConverter")
            .toolbar {
                if isInputFieldFocused {
                    Button("Done") {
                        isInputFieldFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
