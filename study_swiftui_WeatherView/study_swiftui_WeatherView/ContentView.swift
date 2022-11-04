//
//  ContentView.swift
//  study_swiftui_WeatherView
//
//  Created by 원태영 on 2022/11/04.
//

import SwiftUI



struct ContentView: View {
    
    let timeList : [Int] = [8, 9, 10, 11, 12]
    
    let iconList : [Image] = [
        Image(systemName:"sun.max.fill"),
        Image(systemName:"cloud.sun.fill"),
        Image(systemName:"sun.max.fill"),
        Image(systemName:"cloud.fill"),
        Image(systemName:"cloud.rain.fill")
    ]
    
    let tempList : [Int] = [63, 63, 64, 61, 62]
    
    var body: some View {
        VStack {
            
            HStack {
                VStack {
                    Text("서울")
                    Text("63°")
                    
                }
                .font(.title)
                .foregroundColor(.white)
                Spacer()
                VStack {
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                    Text("맑음")
                    HStack {
                        Text("H:68°")
                        Text("L:42°")
                    }
                    
                }
                .modifier(WhiteLargeText())
            }
            .padding(10)
            
            HStack(alignment : .top) {
                ForEach(0...4, id: \.self) { idx in
                    VStack() {
                        Text("\(timeList[idx])AM")
                        Spacer()
                        iconList[idx]
                            .foregroundColor([0,2].contains(idx) ? .yellow : .white)
                        Spacer()
                        Text("\(tempList[idx])°")
                    }
                    .modifier(WhiteLargeText())
                }
                Spacer()
            }
            .frame(width: 340, height: 100)
        }
        .padding()
        .background(Color.gray)
        .border(.white,width: 10)
    }
}

struct WhiteLargeText : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.white)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
