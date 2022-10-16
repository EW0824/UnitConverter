//
//  ContentView.swift
//  Challenge1
//
//  Created by OAA on 12/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    var temperatures = ["Celsius", "Fahrenheit", "Kelvin"]
    var lengths = ["meters", "kilometers", "feet", "yards", "miles"]
    var times = ["seconds", "minutes", "hours", "days"]
    
    @State private var inputTemp = ""
    @State private var outputTemp = ""
    @State private var inputLeng = ""
    @State private var outputLeng = ""
    @State private var inputTime = "seconds"
    @State private var outputTime = "seconds"
    @State private var inputVol = ""
    @State private var outputVol = ""
    
    
    @State private var userTime = 0
    
    var timeInSeconds: Int {
        if inputTime == "minutes" {
            return userTime * 60
        } else if inputTime == "hours" {
            return userTime * 3600
        } else if inputTime == "days" {
            return userTime * 86400
        }
        return userTime
    }

    var convertedTime: Int {
        if outputTime == "minutes" {
            return timeInSeconds / 60
        } else if outputTime == "hours" {
            return timeInSeconds / 3600
        } else if outputTime == "days" {
            return timeInSeconds / 86400
        }
        return timeInSeconds
    }
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker("Input unit", selection: $inputTime) {
                        ForEach(times, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("Input unit")
                }
                
                Section {
                    Picker("Output unit", selection: $outputTime) {
                        ForEach(times, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Unit")
                }
            
                Section {
                    TextField("Enter time to convert:", value: $userTime, format: .number)
                        .keyboardType(.decimalPad)
                    
//                    Text("Time in seconds is \(timeInSeconds) \(inputTime)")
                    
//                    TextField("Amount", value: $checkAmount, format: localCurrency())
//                        .keyboardType(.decimalPad)
//                        .focused($amountIsFocused)
                } header: {
                    Text("Time to convert")
                }
                
                Section {
                    Text("\(userTime) \(inputTime) is around \(convertedTime) \(outputTime)")
//                    Text("\(userTime) \(inputTime) is approximately \(convertedTime, specifier: "%.2f") \(outputTime)")
                } header: {
                    Text("Converted time")
                }
            }
            .navigationTitle("Unit Converter")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
