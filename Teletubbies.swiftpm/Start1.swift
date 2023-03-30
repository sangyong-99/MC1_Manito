//
//  Start.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI
import AVFoundation
import AVKit

struct Start1: View {
    let sound = Bundle.main.path(forResource: "BGM_Start", ofType: "mp3")
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var isNextViewPresented = false
    @State var sceneNumber = 1
    @State var audioPlayer:AVAudioPlayer!
    @State var currentDate: Date = Date()
    @State var timerCount = 1
    
    var body: some View {
        ZStack {
            ZStack{
                if sceneNumber == 1{
                    Image("backgroundfront").resizable()
                }
            }.onReceive(timer, perform: { value in
                currentDate = value
                if sceneNumber == 1{
                    timerCount += 1
                    if timerCount >= 50{
                        timer.upstream.connect().cancel()
                    }
                }
            })
        }
        .background(Image("background").resizable().scaledToFill()).ignoresSafeArea()
    }
}

struct Start0_Previews: PreviewProvider {
    static var previews: some View {
        Start1()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
