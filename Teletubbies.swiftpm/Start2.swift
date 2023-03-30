//
//  Start.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI
import AVFoundation


struct Start2: View {
    let speech = AVSpeechSynthesizer()
    let siri_naration1 = AVSpeechUtterance(string: "넓고 푸른 애플 동산에는 각자 무지개를 찾고 있는 용사들이 살고있었어요.")
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var isNextViewPresented = false
    @State var sceneNumber = 1
    @State var voicecount = 0
    @State var sun_opacity: Double = 0
    @State var currentDate: Date = Date()
    @State var sun_xpos = 160
    @State var sun_ypos = 280
    @State var timerCount = 1
    
    var body: some View {
        ZStack {
            ZStack{
                if sceneNumber == 1{
                    Image("sun").resizable().frame(width: 200, height: 200)
                        .position(x: CGFloat(sun_xpos), y: CGFloat(sun_ypos))
                    Image("backgroundfront").resizable()
                }
                else if sceneNumber == 2 {
                    Image("sun").resizable().frame(width: 200, height: 200)
                        .position(x: CGFloat(sun_xpos), y: CGFloat(sun_ypos))
                    Image("bababack").resizable().frame(width: 250, height: 150)
                        .position(x: CGFloat(670), y: CGFloat(120))
                        .opacity(sun_opacity)
                }
            }.onReceive(timer, perform: { value in
                currentDate = value
                if sceneNumber == 1{
                    sun_ypos -= 4
                    sun_xpos += 1
                    timerCount += 1
                    if timerCount >= 50{
                        sceneNumber += 1
                    }
                }
                if sceneNumber == 2{
                    sun_opacity += 0.1
                    if voicecount == 0{
                        siri_naration1.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                        siri_naration1.rate = 0.45
                        siri_naration1.pitchMultiplier = 1
                        siri_naration1.volume = 50.0
                        speech.speak(siri_naration1)
                        voicecount += 1
                    }
                }
            })
            
        }.background(Image("background").resizable().scaledToFill()).ignoresSafeArea()
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start2()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
