//
//  sixteam.swift
//  Teletubbies
//
//  Created by 신상용 on 2023/03/28.
//

import SwiftUI
import AVFoundation
import AVKit
struct PreviousGame: View {
    let speech = AVSpeechSynthesizer()
    let siri_naration1 = AVSpeechUtterance(string: "여섯 용사들을 모두 태운 탐사선은 무지개 기운이 강하게 느껴지는 곳에 용사들을 데려다줍니다")
    let landing = Bundle.main.path(forResource: "Landing", ofType: "mp3")
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    @State var voicecount = 0
    @State var audioPlayer:AVAudioPlayer!
    @State var sceneNumber = 1
    @State var stop = 1
    @State var ufo_xpos = 430
    @State var ufo_ypos = -40
    @State var six_xsize = 0
    @State var six_ysize:Double = 0
    @State var six_xpos = 430
    @State var six_ypos = 0
    @State var scenecount = 0
    
    var body: some View {
        ZStack{
            ZStack{
                if sceneNumber == 1{
                    Image("ufo").resizable()
                        .frame(width: 250, height: 150)
                        .position(x: CGFloat(430), y: CGFloat(ufo_ypos))
                }
                else if sceneNumber == 2{
                    Image("ufo").resizable().zIndex(1)
                        .frame(width: 250, height: 150)
                        .position(x: CGFloat(430), y: CGFloat(80))
                    Image("sixpeople").resizable()
                        .frame(width: CGFloat(six_xsize), height: CGFloat(six_ysize))
                        .position(x: CGFloat(six_xpos), y: CGFloat(six_ypos))
                }
            }.onReceive(timer, perform: { value in
                if stop == 1{
                    ufo_ypos += 5
                    if ufo_ypos == 80{
                        stop += 1
                    }
                }
                else if stop == 2{
                    if voicecount == 0{
                        siri_naration1.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                        siri_naration1.rate = 0.45
                        siri_naration1.pitchMultiplier = 1
                        siri_naration1.volume = 50.0
                        speech.speak(siri_naration1)
                        voicecount += 1
                    }
                    sceneNumber += 1
                    stop += 1
                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: landing!))
                    audioPlayer?.setVolume(0.1, fadeDuration: 1)
                    audioPlayer?.play()
                }
                else if stop == 3{
                    six_xsize += 15
                    six_ysize += 7.5
                    six_ypos += 15
                    scenecount += 1
                    if scenecount == 20{
                        stop += 1
                    }
                }
            })
        }.background(Image("background").resizable().scaledToFill()).ignoresSafeArea()
    }
}

struct PreviousGame_Previews: PreviewProvider {
    static var previews: some View {
        PreviousGame().previewInterfaceOrientation(.landscapeRight)
    }
}
