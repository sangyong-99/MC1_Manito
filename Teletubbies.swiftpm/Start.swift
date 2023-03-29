//
//  Start.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI
import AVFoundation

struct Start: View {
    @State private var isNextViewPresented = false
    @State var sceneNumber = 1
    @State var dkdk: Double = 0
    @State var currentDate: Date = Date()
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var sun_xpos = 160
    @State var sun_ypos = 280
    @State var timerCount = 1
    var body: some View {
        ZStack {
            ZStack{
                if sceneNumber == 1{
                    Image("sun").resizable().frame(width: 200, height: 200)
                        .position(x: CGFloat(sun_xpos), y: CGFloat(sun_ypos))
                    Image("backgroundfront").resizable()
                }
                else if sceneNumber == 2 {
                    Image("sun").resizable().frame(width: 200, height: 200)
                        .position(x: CGFloat(sun_xpos), y: CGFloat(sun_ypos))
                    Image("bababack").resizable().frame(width: 250, height: 150)
                        .position(x: CGFloat(670), y: CGFloat(120))
                        .opacity(dkdk)
                }
            }.onReceive(timer, perform: { value in
                currentDate = value
                if sceneNumber == 1{
                    sun_ypos -= 4
                    sun_xpos += 1
                    timerCount += 1
                    if timerCount >= 50{
                        sceneNumber += 1
                    }
                }
                if sceneNumber == 2{
                    dkdk += 0.1
                }
                
            })
            
        }.background(Image("background").resizable().scaledToFill()).ignoresSafeArea()
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
