//
//  ContentView.swift
//  propzi-ios-app-home-screen-charts
//
//  Created by Winston T Chikazhe on 16/12/2020.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {

    @State private var selectedTab = 1

    @State var data1: [Double] = (0..<16).map { _ in .random(in: 9.0...100.0) }
    @State var data2: [Double] = (0..<16).map { _ in .random(in: 9.0...100.0) }
    @State var data3: [Double] = (0..<12).map { _ in .random(in: 9.0...100.0) }
    @State var data4: [Double] = (0..<8) .map { _ in .random(in: 1.0...125.0) }
    
    let greenStyle = ChartStyle(backgroundColor: .white,
                               foregroundColor: [ColorGradient(Color(#colorLiteral(red: 0.2685751915, green: 0.8209512234, blue: 0.7121270299, alpha: 1)), Color(#colorLiteral(red: 0.3838092983, green: 0.7259919047, blue: 0.8139997125, alpha: 1)))])
    let mixedColorStyle = ChartStyle(backgroundColor: .white, foregroundColor: [
        ColorGradient(Color(#colorLiteral(red: 0.2685751915, green: 0.8209512234, blue: 0.7121270299, alpha: 1)), Color(#colorLiteral(red: 0.3838092983, green: 0.7259919047, blue: 0.8139997125, alpha: 1))),
        ColorGradient(Color(#colorLiteral(red: 0.9765821099, green: 0.7748613954, blue: 0.3606334925, alpha: 1)), Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
    ])
    let goldStyle = ChartStyle(backgroundColor: .white,
                               foregroundColor: [ColorGradient(Color(#colorLiteral(red: 0.9765821099, green: 0.7748613954, blue: 0.3606334925, alpha: 1)), Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))])
    let propziStyle = ChartStyle(backgroundColor: .white,
                                 foregroundColor: [ColorGradient(Color(#colorLiteral(red: 0.2685751915, green: 0.8209512234, blue: 0.7121270299, alpha: 1)), Color(#colorLiteral(red: 0.9765821099, green: 0.7748613954, blue: 0.3606334925, alpha: 1)))])

    let multiStyle = ChartStyle(backgroundColor: Color.green.opacity(0.2),
                                foregroundColor:
                                    [ColorGradient(.purple, .blue),
                                     ColorGradient(.orange, .red),
                                     ColorGradient(.green, .yellow),
                                     ColorGradient(.red, .purple),
                                     ColorGradient(.yellow, .orange),
                                    ])

    var body: some View {
        VStack {
            HeaderView()
            HStack {
                Button(action: {
                    self.data1 = (0..<16).map { _ in .random(in: 9.0...100.0) } as [Double]
                    self.data2 = (0..<16).map { _ in .random(in: 9.0...100.0) } as [Double]
                    self.data3 = (0..<16).map { _ in .random(in: 9.0...100.0) } as [Double]
                    self.data4 = (0..<8) .map { _ in .random(in: 1.0...125.0) } as [Double]
                }) {
                    Text("resizable chart: just put into a frame of the size you want. ")
                        .foregroundColor(.primary)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    VStack {
                        Text("1. swift package url: https://github.com/AppPear/ChartView.git")
                            .foregroundColor(.primary)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("2. choose exact version")
                            .foregroundColor(.primary)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("2.0.0-beta.1")
                            .foregroundColor(.primary)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    
                }
                

                Spacer()
                // Other controls
            }
            .padding()

            TabView(selection: $selectedTab) {
                
                VStack {

                    BarChart()
                        .data(data2)
                        .chartStyle(mixedColorStyle)


                    CardView {
                        ChartLabel("Bar Chart", type: .legend)
                        BarChart()
                    }
                    .data(data3)
                    .chartStyle(propziStyle)
                    .frame(width: 160, height: 240)
                    .padding()
                }
                .tabItem { Image(systemName:"chart.bar.xaxis") }.tag(1)
                VStack {

                    PieChart()
                        .data(data1)
                        .chartStyle(greenStyle)

                    CardView {
                        ChartLabel("Pie Chart", type: .title)
                        PieChart()
                    }
                    .data(data2)
                    .chartStyle(goldStyle)
                    .padding()


                }
                .tabItem { Image(systemName:"chart.pie.fill") }.tag(2)



                VStack {

                    CardView(showShadow: true) {
                        ChartLabel("Line Chart", type: .subTitle)
                        LineChart()
                    }
                    .data(data1)
                    .chartStyle(goldStyle)
                    .padding()


                    LineChart()
                        .data(data2)
                        .chartStyle(greenStyle)

                }
                .tabItem { Image(systemName:"waveform.path.ecg.rectangle") }.tag(3)

                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


