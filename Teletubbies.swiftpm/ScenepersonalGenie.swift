//
//  Scene4.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//
import SwiftUI
import AVFoundation
import AVKit

struct ScenepersonalGenie: View {
    let speech = AVSpeechSynthesizer()
    let siri_naration1 = AVSpeechUtterance(string: "마지막으로 보라색 용사 지니가 보입니다. 일상에 단조로움을 느끼던 지니는 일탈 무지개를 찾고있었어요. 탐사선을 발견한 지니는 모험이다! 외치며 탐사선에 탑승합니다.")
    @State var voicecount = 0
    @State var audioPlayer:AVAudioPlayer!
    
    @State var sceneNumber = 1
    @State var updown = false
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let timerss = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let takeoff = Bundle.main.path(forResource: "takeoff", ofType: "mp3")
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    @State var up_down: Int = 1
    @State var xpos = 430
    @State var ypos = 300
    @State var rec_xsize = 130
    @State var rec_ysize = 0
    @State var rec_ypos = 100
    @State var countss = 1
    @State var ufo_xpos = 430
    @State var ufo_ypos = 50
    @State var audio_scene_count = 1
    @State var audio_scene_bool: Bool = false
    
    
    
    var body: some View {
        ZStack {
            
            ZStack{
                
                
                if sceneNumber == 1 {
                    if change {
                        Image("Geine1").resizable().frame(width:120, height:132)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                    else {
                        Image("Geine2").resizable().frame(width:120, height:132)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                }
                else if sceneNumber == 2 {
                    Image("ufo").resizable()
                        .frame(width: 250, height: 150)
                        .position(x: CGFloat(430), y: CGFloat(80))
                        .zIndex(1)
                    
                    Image("Geine1").resizable().frame(width:120, height:132)
                        .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    Rectangle()
                        .frame(width: CGFloat(rec_xsize), height: CGFloat(rec_ysize))
                        .position(x: CGFloat(430), y: CGFloat(rec_ypos))
                        .foregroundColor(.yellow)
                        .opacity(0.5)
                        .animation(.linear(duration: 2.5), value: rec_ysize)
                }
                else if sceneNumber == 3{
                    Image("ufo").resizable()
                        .frame(width: 250, height: 150)
                        .position(x: CGFloat(ufo_xpos), y: CGFloat(ufo_ypos))
                    
                }
                
                
            }
            .onReceive(timer, perform: { value in
                currentDate = value
                change.toggle()
                
                
                
                if countss == 1{
                    countss += 1
                    
                    if voicecount == 0{
                        
                        siri_naration1.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                        siri_naration1.rate = 0.4
                        siri_naration1.pitchMultiplier = 1
                        siri_naration1.volume = 50.0
                        speech.speak(siri_naration1)
                        voicecount += 1
                    }
                }
                else if countss < 6{
                    if change {
                        ypos -= 20
                        
                    }
                    else {
                        ypos += 20
                        
                    }
                    countss += 1
                }
                else {
                    sceneNumber += 1
                    timer.upstream.connect().cancel()
                }
            })
            .onReceive(timerss, perform: {value in
                currentDate = value
                
                if countss == 6{
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
            Spacer()
            
        }
        
        .background(Image("background").resizable().scaledToFill()).ignoresSafeArea()
    }
}

struct Scenepersonal1_Previews: PreviewProvider {
    static var previews: some View {
        ScenepersonalGenie()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

