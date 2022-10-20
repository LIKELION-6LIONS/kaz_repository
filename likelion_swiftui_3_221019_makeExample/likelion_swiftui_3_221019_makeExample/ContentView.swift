//
//  ContentView.swift
//  likelion_swiftui_3_221019_makeExample
//
//  Created by 원태영 on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    
    var colorSet : [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    
    @State private var colorIndex = 0
    @State private var rotation : Double = 0
    @State private var myText : String = "W"
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                // URL에서 이미지 받아오기
                // resizable을 클로저로 지정해줘야 frame 속성자로 사이즈를 조절할 수 있음
                AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/%EB%A9%8B%EC%9F%81%EC%9D%B4%EC%82%AC%EC%9E%90%EC%B2%98%EB%9F%BC_%EB%A1%9C%EA%B3%A0.png/692px-%EB%A9%8B%EC%9F%81%EC%9D%B4%EC%82%AC%EC%9E%90%EC%B2%98%EB%9F%BC_%EB%A1%9C%EA%B3%A0.png")) {image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                
                Text(myText)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .rotationEffect(.degrees(rotation)) // Double 타입을 받아서 Angle로 변환해줌
    //                .animation(.easeInOut(duration: 5))
                    .foregroundColor(colorSet[colorIndex])
            }
            
            
            
            Spacer()
            Divider()
                .border(Color.black)
            
            Group {
                Slider(value : $rotation, in : 0...360, step : 1.0)
                
                TextField("Enter Your Text", text: $myText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Picker(selection : $colorIndex, label : Text("my Color")) {
                    
                    ForEach (0..<colornames.count) {
                        Text(colornames[$0])
                            .foregroundColor(colorSet[$0])
                    }
                    
                }
                .pickerStyle(.wheel)
            }
            .padding()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
