//
//  Scene11.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI
import AVFoundation
import AVKit

struct ScenepersonalLily: View {
    let speech = AVSpeechSynthesizer()
    let siri_naration1 = AVSpeechUtterance(string: "드넓은 동산에서 가장 먼저 보이는 건 빨간색 용사 릴리예요.-- 언제나 즐거운 릴리는 애플 동산에서 더 큰 '재미 무지개'를 찾고 싶어해요. 그래서 무지개 탐사선에 첫 번째로 올라탑니다.")
    let lilyufo = Bundle.main.path(forResource: "lilyufo", ofType: "mp3")
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let milli_timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var ufo_ypos_list: [Int] = [8, 8, 8, 7, 7, 6, 6, 5, 5, 4, 3, 2, 1, 0, 0, 0 ,-3, -4, -5, -8]
    @State var voicecount = 0
    @State var sceneNumber = 1
    @State var timerCount = 0
    @State var audioPlayer:AVAudioPlayer!
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    @State var audio_scene_count = 1  //scene if 넘어가는 인트
    @State var audio_scene_bool: Bool = false   //scene if 넘어가는 불
    @State var xpos = 400
    @State var ypos = 240
    @State var ufo_xpos = 640
    @State var ufo_ypos = 280
    @State var ufo_ypos_list_index = 0
    @State var ufo_xsize: CGFloat = 500
    @State var ufo_ysize: CGFloat = 400
    
    var body: some View {
        ZStack {
            ZStack{
                if sceneNumber == 1 { // 점프하면서 대사?
                    if change {
                        Image("Lily1").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                    else {
                        Image("Lily2").resizable().frame(width:150, height:155)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                }
                else if sceneNumber == 2{ // UFO로 쏙 들어가는 릴리
                    ZStack{
                        Image("Lily1").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                }
                else if sceneNumber == 3 { // 릴리가 탄 UFO 포물선(ND가 구현할예정)모양으로 화면에서 빠져나간다.
                    ZStack{
                        Image("ufo").resizable().frame(width:ufo_xsize, height: ufo_ysize)
                            .position(x: CGFloat(ufo_xpos), y: CGFloat(ufo_ypos))
                    }
                }
                else {
                    
                }
            }.onReceive(timer, perform: { value in
                currentDate = value
                change.toggle()
                timerCount += 1
                if voicecount == 0{
                    siri_naration1.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                    siri_naration1.rate = 0.4
                    siri_naration1.pitchMultiplier = 1
                    siri_naration1.volume = 50.0
                    speech.speak(siri_naration1)
                    voicecount += 1
                }
                if sceneNumber == 1 && timerCount%2 == 1 {
                    ypos -= 10
                }
                else if sceneNumber == 1 && timerCount%2 == 0{
                    ypos += 10
                }
                if timerCount >= 12 {
                    sceneNumber = 2
                    timer.upstream.connect().cancel()
                }
            }).onReceive(milli_timer, perform: { value in
                if sceneNumber == 2 {
                    if sceneNumber == 2 && xpos < 600 {
                        xpos += 10
                        ypos -= ufo_ypos_list[ufo_ypos_list_index]
                        ufo_ypos_list_index += 1
                    }
                    else {
                        sceneNumber = 3
                    }
                }
                else if sceneNumber == 3 {
                    if xpos > 0 {
                        xpos -= 10
                        ypos -= 5
                        if !audio_scene_bool && audio_scene_count == 1{
                            audio_scene_bool.toggle()
                            audio_scene_count += 1
                        }
                        if audio_scene_bool && audio_scene_count == 2{
                            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: lilyufo!))
                            audioPlayer?.setVolume(0.1, fadeDuration: 1)
                            audioPlayer?.play()
                        }
                        audio_scene_bool = false
                        ufo_xpos -= 10
                        ufo_ypos -= 5
                        //UFO 포물선 날아가는거 나중에 작업
                        
                        ufo_xsize -= 7
                        ufo_ysize -= 6
                    }
                    if ufo_ysize <= 50{
                        audioPlayer?.stop()
                    }
                }
            })
        }.background(Image("background").resizable().scaledToFill()).ignoresSafeArea()
    }
}

struct Scenepersonal0_Previews: PreviewProvider {
    static var previews: some View {
        ScenepersonalLily()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
