//
//  ContentView.swift
//  tempConvert
//
//  Created by harshit agarwal on 16/04/21.
//

import SwiftUI

struct ContentView: View {
    @State private var tempValue = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    var conversion: Double{
        let givenTemp =  Double(tempValue) ?? 0
        let givenUnit = inputUnit
        let convertedUnit = outputUnit
        if givenUnit == convertedUnit{
            return givenTemp
        }else{
            switch (givenUnit,convertedUnit) {
            case (0,1):
                return (givenTemp * 1.8) + 32
            case (0,2):
                return givenTemp + 273.75
            case (1,0):
                return (givenTemp - 32)/1.8
            case (1,2):
                return (givenTemp - 32)/1.8 + 273.15
            case (2,0):
                return givenTemp - 273.75
            case (2,1):
                return ((givenTemp - 273.75)*1.8) + 32
            default:
                return 0
            }
        }
    }
    let tempUnits = ["C","F","K"]
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Enter the teperature value")){
                TextField("Temperature Value",text : $tempValue)
                    
                    .keyboardType(.decimalPad)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
                    .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                
                    Picker ("Temperature Unit", selection : $inputUnit){
                        ForEach(0..<tempUnits.count){
                            units in Text("\(tempUnits[units])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                        

                }
                .accentColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
                Text("Temp \(tempValue) \(tempUnits[inputUnit])")
                    .foregroundColor(Color.orange)
                
                
                Section(header: Text("The Converted Value")){
                    Picker ("Temperature Unit", selection : $outputUnit){
                        ForEach(0..<tempUnits.count){
                            units in Text("\(tempUnits[units])")
                                .bold()
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("Temp \(conversion,specifier: " %.2f ")\(tempUnits[outputUnit])")
                        .keyboardType(.decimalPad)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
                        .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                }
                
            }
            .navigationBarTitle("Temp Converter",displayMode:.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
