//
//  Scene4.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//
import SwiftUI
import AVFoundation
import AVKit

struct Scenepersonal4: View {
    let speech = AVSpeechSynthesizer()
    let siri_naration1 = AVSpeechUtterance(string: "굶주린 노란 용사 로키는 취뽀 무지개를 찾고 있었어요. 릴리와 수는 튀김 소보로로 로키를 꾀어 함께 하자고 말해요. 이거 줄테니까 우리랑 같이 갈래?. 로키는 홀린 듯 우주선에 올라타요.")
    @State var voicecount = 0
    @State var sceneNumber = 1
    @State var updown = false
    @State var audioPlayer:AVAudioPlayer!
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
    @State var countdk = 1
    @State var dkdkdkdk: Bool = false
    let syynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        ZStack {
            
            ZStack{
                
                
                if sceneNumber == 1 {
                    if change {
                        Image("loki1").resizable().frame(width:120, height:132)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                    else {
                        Image("loki2").resizable().frame(width:120, height:132)
                            .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    }
                }
                else if sceneNumber == 2 {
                    Image("ufo").resizable()
                        .frame(width: 250, height: 150)
                        .position(x: CGFloat(430), y: CGFloat(80))
                        .zIndex(1)
                    Image("loki1").resizable().frame(width:120, height:132)
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
                
                
            }.onReceive(timer, perform: { value in
                currentDate = value
                change.toggle()
                if voicecount == 0{
                    
                    siri_naration1.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                    siri_naration1.rate = 0.45
                    siri_naration1.pitchMultiplier = 1
                    siri_naration1.volume = 50.0
                    speech.speak(siri_naration1)
                    voicecount += 1
                }
                if countss == 1{
                    countss += 1
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
                        if !dkdkdkdk && countdk == 1{
                            dkdkdkdk.toggle()
                            countdk += 1
                        }
                        if dkdkdkdk && countdk == 2{
                            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: takeoff!))
                            audioPlayer?.play()
                        }
                        dkdkdkdk = false
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

struct Scenepersonal4_Previews: PreviewProvider {
    static var previews: some View {
        Scenepersonal4()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

