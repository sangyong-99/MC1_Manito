//
//  MonsterAppear.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/29.
//

import SwiftUI
import AVFoundation

struct MonsterAppear: View {
    let speech = AVSpeechSynthesizer()
    let siri_naration1 = AVSpeechUtterance(string: "하지만 눈 앞에 나타난 건 무지개가 아니라 거대한 흑백의 챌린지 괴물이었어요! 흑백의 챌린지 괴물은 우리의 색을 빼앗는 무시무시한 괴물이에요.")
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let milli_timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var bossImageList: [Image] = [Image("bossMonster_basic"), Image("bossMonster_try"), Image("bossMonster_basic_reverse"), Image("bossMonster_try_reverse")]
    @State var listIndex = 0
    @State var currentDate: Date = Date()
    @State var voicecount = 0
    @State var timerCount = 0
    @State var sceneNumber = 1
    @State var change = true
    @State var blackOpacity = 1.0
    
    var body: some View {
        ZStack {
            ZStack{
                Rectangle().fill(.black).zIndex(1).opacity(blackOpacity).animation(.easeIn(duration: 2), value: blackOpacity)
                if sceneNumber == 1 {
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(350), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(350), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 2 {
                    bossImageList[listIndex].resizable().frame(width:400, height:300)
                        .position(x: CGFloat(350), y: CGFloat(200))
                }
                else if sceneNumber == 3{
                    bossImageList[listIndex].resizable().frame(width:400, height:300)
                        .position(x: CGFloat(350), y: CGFloat(200))
                }
            }.onReceive(timer, perform: { value in
                if voicecount == 0{
                    siri_naration1.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                    siri_naration1.rate = 0.35
                    siri_naration1.pitchMultiplier = 1
                    siri_naration1.volume = 50.0
                    speech.speak(siri_naration1)
                    voicecount += 1
                }
                if sceneNumber == 1 {
                    timerCount += 1
                    if timerCount > 5 {
                        sceneNumber = 2
                        timerCount = 0
                    }
                }
                else if sceneNumber == 2 {
                    blackOpacity = 0
                    timerCount += 1
                    if timerCount > 7 {
                        sceneNumber = 3
                        timerCount = 0
                    }
                }
            })
            .onReceive(milli_timer, perform: {value in
                if sceneNumber == 3 {
                    listIndex += 1
                    if listIndex >= 4 {
                        listIndex = 0
                    }
                }
            })
        }
        .background(Image("background").resizable().scaledToFill()).ignoresSafeArea()
    }
}

struct MonsterAppear_Previews: PreviewProvider {
    static var previews: some View {
        MonsterAppear()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
