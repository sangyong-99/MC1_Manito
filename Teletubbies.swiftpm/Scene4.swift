//
//  Scene4.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//
import SwiftUI
import AVFoundation

struct Scene4: View {
    @State var sceneNumber = 1
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    
    @State var xpos = 200
    @State var ypos = 240
    
    @State var text1 = ""
    
    let syynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        ZStack {
            
            ZStack{
                if sceneNumber == 1 {
                    if change {
                        Image("left").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                    else {
                        Image("right").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                }
                else if sceneNumber == 2{
                    if change {
                        Image("left_reverse").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                    else {
                        Image("right_reverse").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                }
                else if sceneNumber == 3 {
                    Image("right_reverse").resizable().frame(width:100, height:150)
                        .position(x: CGFloat(xpos), y: CGFloat(ypos))
                }
                else {
                    
                }
                
            }.onReceive(timer, perform: { value in
                currentDate = value
                
                change.toggle()
                
                if sceneNumber == 1 && xpos == 200 {
                    let utterance = AVSpeechUtterance(string: text1)
                    utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                    utterance.rate = 0.4
                    syynthesizer.speak(utterance)
                }
                if sceneNumber == 1 && xpos < 500 {
                    xpos += 10
                }
                else if sceneNumber == 1 && xpos >= 500 {
                    sceneNumber = 2
                }
                else if sceneNumber == 2 && xpos > 400{
                    xpos -= 10
                }
                else if sceneNumber == 2 && xpos <= 400 {
                    sceneNumber = 3
                }
                else if sceneNumber == 3 {
                    
                }
                
            })
            Spacer()
            
        }
        .background(Image("background_school"))
    }
}

struct Scene4_Previews: PreviewProvider {
    static var previews: some View {
        Scene4()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

