//
//  Start.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI
import AVFoundation
import AVKit

struct End: View {
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let laugh = Bundle.main.path(forResource: "laugh", ofType: "mp3")
    let speech = AVSpeechSynthesizer()
    let siri_naration1 = AVSpeechUtterance(string:"여섯 용사들은 무지개 아래에서 꺄르륵 꺄르륵 행복해해요.")
    @State var voicecount = 0
    @State var audioPlayer:AVAudioPlayer!
    @State var sceneNumber = 1
    @State var timerCount = 0
    @State var rotation = 0.0
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    @State var isTimerRunning = true
    @State var attack_xpos = 500
    @State var attack_ypos = 250
    @State var color_attack_xpos = 200
    @State var color_attack_ypos = 250
    @State var audio_scene_count = 1
    @State var audio_scene_bool: Bool = false
    @State var rainbow_opacity = false
    
    var body: some View {
        ZStack {
            ZStack{
                if sceneNumber == 1{
                    Image("background").resizable().scaledToFill().ignoresSafeArea()
                    Image("sixpeople").resizable().frame(width: CGFloat(200), height: CGFloat(80))
                        .position(x: CGFloat(500), y: CGFloat(300))
                    Image("rainbow").resizable().frame(width:1000, height:400)
                        .opacity(rainbow_opacity ? 1.0 : 0.0)
                        .animation(.easeIn(duration:2.5), value: rainbow_opacity)
                    Image("sun").resizable().frame(width: 200, height: 200)
                        .rotationEffect(.degrees(rotation), anchor: .center)
                        .position(x: CGFloat(200), y: CGFloat(80))
                    Image("sun").resizable().frame(width: 200, height: 200)
                        .rotationEffect(.degrees(rotation), anchor: .center)
                        .position(x: CGFloat(810), y: CGFloat(80))
                }
                
            }.onReceive(timer, perform: { value in
                currentDate = value
                change.toggle()
                if voicecount == 0{
                    siri_naration1.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                    siri_naration1.rate = 0.38
                    siri_naration1.pitchMultiplier = 1
                    siri_naration1.volume = 50.0
                    speech.speak(siri_naration1)
                    voicecount += 1
                }
                timerCount += 1
                if timerCount > 3 {
                    rainbow_opacity = true
                    if !audio_scene_bool && audio_scene_count == 1{
                        audio_scene_bool.toggle()
                        audio_scene_count += 1
                    }
                    if audio_scene_bool && audio_scene_count == 2{
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: laugh!))
                        audioPlayer?.setVolume(0.35, fadeDuration: 1)
                        audioPlayer?.play()
                    }
                    audio_scene_bool = false
                }
                rotation += 20
            })
        }
    }
}

struct End_Previews: PreviewProvider {
    static var previews: some View {
        End()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
