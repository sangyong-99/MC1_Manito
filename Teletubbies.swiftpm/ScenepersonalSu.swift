//
//  Scene4.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//
import SwiftUI
import AVFoundation
import AVKit

struct ScenepersonalSu: View {
    let speech = AVSpeechSynthesizer()
    let siri_naration1 = AVSpeechUtterance(string: "어?---------- 저기 해맑게 웃고있는 주황색 용사 수가 보이네요. 수는 오래간 낭만 무지개를 쫓아왔어요. “내가 이 여정에 낭만을 더해줄게!. 수는 반갑게 무지개 탐사선에 탑승합니다.")
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let timerss = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let takeoff = Bundle.main.path(forResource: "takeoff", ofType: "mp3")
    @State var voicecount = 0
    @State var sceneNumber = 1
    @State var updown = false
    @State var audioPlayer:AVAudioPlayer!
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    @State var up_down: Int = 1
    @State var xpos = 430
    @State var ypos = 300
    @State var rec_xsize = 130
    @State var rec_ysize = 0
    @State var rec_ypos = 100
    @State var scenecount = 1
    @State var ufo_xpos = 430
    @State var ufo_ypos = 50
    @State var audio_scene_count = 1
    @State var audio_scene_bool: Bool = false
    
    var body: some View {
        ZStack {
            ZStack{
                if sceneNumber == 1 {
                    if change {
                        Image("su1").resizable().frame(width:120, height:132)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                    else {
                        Image("su2").resizable().frame(width:120, height:132)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                }
                else if sceneNumber == 2 {
                    Image("ufo").resizable()
                        .frame(width: 250, height: 150)
                        .position(x: CGFloat(430), y: CGFloat(80))
                        .zIndex(1)
                    Image("su1").resizable().frame(width:120, height:132)
                        .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    Rectangle()
                        .frame(width: CGFloat(rec_xsize), height: CGFloat(rec_ysize))
                        .position(x: CGFloat(430), y: CGFloat(rec_ypos))
                        .foregroundColor(.yellow)
                        .opacity(0.5)
                        .animation(.linear(duration: 0.5), value: rec_ysize)
                }
                else if sceneNumber == 3{
                    Image("ufo").resizable()
                        .frame(width: 250, height: 150)
                        .position(x: CGFloat(ufo_xpos), y: CGFloat(ufo_ypos))
                    
                }
            }.onReceive(timer, perform: { value in
                currentDate = value
                change.toggle()
                if voicecount == 0{
                    siri_naration1.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                    siri_naration1.rate = 0.4
                    siri_naration1.pitchMultiplier = 1
                    siri_naration1.volume = 50.0
                    speech.speak(siri_naration1)
                    voicecount += 1
                }
                if scenecount == 1{
                    scenecount += 1
                }
                else if scenecount < 6{
                    if change {
                        ypos -= 20
                    }
                    else {
                        ypos += 20
                    }
                    scenecount += 1
                }
                else {
                    sceneNumber += 1
                    timer.upstream.connect().cancel()
                }
            })
            .onReceive(timerss, perform: {value in
                currentDate = value
                if scenecount == 6{
                    if up_down == 1 {
                        rec_ysize += 20
                        rec_ypos += 10
                        if rec_ysize == 280{
                            up_down += 1
                        }
                    }
                    else if up_down == 2{
                        rec_ysize -= 20
                        rec_ypos -= 10
                        ypos -= 20
                        if !audio_scene_bool && audio_scene_count == 1{
                            audio_scene_bool.toggle()
                            audio_scene_count += 1
                        }
                        if audio_scene_bool && audio_scene_count == 2{
                            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: takeoff!))
                            audioPlayer?.setVolume(0.1, fadeDuration: 1)
                            audioPlayer?.play()
                        }
                        audio_scene_bool = false
                        if rec_ysize == 0 {
                            sceneNumber += 1
                            up_down += 1
                        }
                    }
                    else if up_down == 3{
                        ufo_ypos -= 10
                    }
                }
            })
        }
        .background(Image("background").resizable().scaledToFill()).ignoresSafeArea()
    }
}

struct Scenepersonal2_Previews: PreviewProvider {
    static var previews: some View {
        ScenepersonalSu()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

