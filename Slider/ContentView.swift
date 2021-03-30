//
//  ContentView.swift
//  Slider
//
//  Created by Aleksei Goranov on 29.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue: Double = 75
    @State private var greenSliderValue: Double = 150
    @State private var blueSliderValue: Double = 225
    
    var body: some View {
        VStack {
             let rectangleColor = Color(
                red: redSliderValue/255,
                green: greenSliderValue/255,
                blue: blueSliderValue/255)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 175)
                .foregroundColor(rectangleColor)
            Sliders(value: $redSliderValue,  color: .red)
            Sliders(value: $greenSliderValue, color: .green)
            Sliders(value: $blueSliderValue, color: .blue)
           Spacer()
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Sliders: View {
    @Binding var value: Double
    @State var alertPresented: Bool = false
    var color: Color
    var body: some View {
        HStack {
            Text("\(lround(value))")
            Slider(value: $value, in: 0...255)
                .accentColor(color)
            TextField("", value: $value, formatter: NumberFormatter.number, onCommit: checkNumber)
                .border(color)
                .frame(width: 35)
                .alert(isPresented: $alertPresented) {
                    Alert(title: Text("Wrong Format"), message: Text("Enter number from 0 to 255"))
                }
        }
        .padding(.horizontal)
    }
    
    private func checkNumber() {
        if value > 255 || value < 0 {
            value = 112
            alertPresented.toggle()
            return
        }
    }
}

extension NumberFormatter {
    static var number: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }
}

