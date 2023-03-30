//
//  ThreeThree.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/30.
//

import SwiftUI
import AVFoundation
import AVKit

struct ThreeThree: View {
    
    let speech = AVSpeechSynthesizer()
    let siri_naration1 = AVSpeechUtterance(string: "우리 저 괴물을 우리의 사과 폭탄으로 물리치자!")
    let siri_naration2 = AVSpeechUtterance(string: "그것보단 우리의 대왕 소보로로 물리치는게 더 좋을걸?")
    
    @State var change = true;
    @State var sceneNumber = 1
    @State var currentDate: Date = Date()
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State var timerCount = 1
    
    let three1 = Bundle.main.path(forResource: "three1", ofType: "mp3")
    let three2 = Bundle.main.path(forResource: "three2", ofType: "mp3")
    @State var audioPlayer: AVAudioPlayer!
    
    @State var audio_scene_count = 1
    @State var audio_scene_bool = false
    
    
    var body: some View {
        ZStack {
            ZStack{
                if change {
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(220))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(650), y: CGFloat(270))
                }
                else {
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(140), y: CGFloat(220))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(660), y: CGFloat(270))
                }
                
            }.onReceive(timer, perform: { value in
                currentDate = value
                change.toggle()
                
                if sceneNumber == 1{
                    timerCount += 1
                    if timerCount > 3{
                        
                        /*
                        siri_naration1.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                        siri_naration1.rate = 0.5
                        siri_naration1.pitchMultiplier = 1
                        siri_naration1.volume = 50.0
                        speech.speak(siri_naration1)
                        */
                        
                        /*
                        if !audio_scene_bool && audio_scene_count == 1 {
                            audio_scene_bool.toggle()
                            audio_scene_count += 1
                        }
                        if audio_scene_bool && audio_scene_count == 2 {
                            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: three1!))
                            audioPlayer?.play()
                        }
                        audio_scene_bool = false
                         */
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: three1!))
                        audioPlayer?.play()
                        
                        sceneNumber = 2
                        timerCount = 0
                    }
                }
                if sceneNumber == 2{
                    timerCount += 1
                    if timerCount > 8{
                        
                        /*
                        siri_naration2.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                        siri_naration2.rate = 0.5
                        siri_naration2.pitchMultiplier = 1
                        siri_naration2.volume = 50.0
                        speech.speak(siri_naration2)
                         */
                        
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: three2!))
                        audioPlayer?.play()
                        
                        sceneNumber = 3
                        timerCount = 0
                    }
                }
                if sceneNumber == 3{
                    
                }
            })
        }.background(Image("background").resizable().scaledToFill()).ignoresSafeArea()
    }
}

struct ThreeThree_Previews: PreviewProvider {
    static var previews: some View {
        ThreeThree()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
