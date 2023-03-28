//
//  ND1.swift
//  MC1_Manito
//
//  Created by 신상용 on 2023/03/24.
//

import Foundation
import SwiftUI
import UIKit
import AVFoundation

struct ND1: View {
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
        
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    @State var isTimerRunning = true
        
    @State var xpos = 0
    @State var ypos = 150
    let speech = AVSpeechSynthesizer()
        var body: some View {
            ZStack {
                
                ZStack{
                    Image("IMG_0089").resizable()
                        .frame(width: 100, height: 150)
                        .position(x: CGFloat(700), y: CGFloat(150))
                    
                    if self.isTimerRunning {
                        if change {
                            Image("1").resizable().frame(width:100, height:150)
                                .position(x: CGFloat(xpos), y: CGFloat(ypos))
                        }
                        else {
                            Image("2").resizable().frame(width:100, height:150)
                                .position(x: CGFloat(xpos), y: CGFloat(ypos))
                        }
                    }
                    else {
                        Image("1").resizable().frame(width:100, height:150)
                            .position(x: CGFloat(600), y: CGFloat(150))
                    }
                    
                }.onReceive(timer, perform: {value in
                    currentDate = value
                    change.toggle()
                    if xpos == 0{
                        
                        let aa = AVSpeechUtterance(string: "안녕하세요 저는 아아아아아아")
                        aa.voice = AVSpeechSynthesisVoice(language: "ko-KR")
                        aa.rate = 0.5
                        aa.pitchMultiplier = 1
                        aa.volume = 3.0
                        speech.speak(aa)
                    }
                    xpos += 40
                    if xpos > 600 {
                        isTimerRunning = false
                    }
                })
                Spacer()
                
            }
        }
    
    
    
    //original stopmotion code
//    let timer = Timer.publish(every: 0.35, on: .main, in: .common).autoconnect()
//
//    @State var currentDate: Date = Date()
//    @State var bb: Bool = true
//
//    var body: some View {
//        ZStack{
//            if bb {
//                Image("1").resizable().scaledToFill()
//            }
//            else {
//                Image("2").resizable().scaledToFill()
//            }
//
//        }.onReceive(timer, perform: {value in
//            currentDate = value
//            bb = !bb
//        })
//
//
//    }
}
struct ND1_Previews: PreviewProvider {
    static var previews: some View {
        ND1()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
