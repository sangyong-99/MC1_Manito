//
//  Scene2.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI
import AVFoundation

struct Scene2: View {
    @State var sceneNumber = 1
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    @State var isTimerRunning = true
    
    @State var xpos = 200
    @State var ypos = 240
    
    @State var text1 = "나는야 대학생 로키. 학교에서 돌을 던지는걸 좋아한다. 다 덤벼라"
    
    let syynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        ZStack {
            
            ZStack{
                if self.isTimerRunning {
                    if change {
                        Image("left").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                    else {
                        Image("right").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                }
                else {
                    if change {
                        Image("left_reverse").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                    else {
                        Image("right_reverse").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                }
                
            }.onReceive(timer, perform: { value in
                currentDate = value
                change.toggle()
                xpos += 10
                if xpos == 210 {
                    let utterance = AVSpeechUtterance(string: self.text1)
                    utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                    utterance.rate = 0.4
                    //syynthesizer.speak(utterance)
                }
                if xpos > 500 {
                    isTimerRunning = false
                }
            })
            Spacer()
            
        }
        .background(Image("background_school"))
    }
}

struct Scene2_Previews: PreviewProvider {
    static var previews: some View {
        Scene2()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
