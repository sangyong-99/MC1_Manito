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
    @State var currentDate: Date = Date()
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State var sun_xpos = 160
    @State var sun_ypos = 280
    @State var timerCount = 1
    var body: some View {
        ZStack {
            ZStack{
                if sceneNumber == 1{
                    Image("sun").resizable().frame(width: 200, height: 200)
                        .position(x: CGFloat(sun_xpos), y: CGFloat(sun_ypos))
                    
                }
            }.onReceive(timer, perform: { value in
                currentDate = value
                if sceneNumber == 1{
                    sun_ypos -= 10
                    sun_xpos += 3
                    timerCount += 1
                    if timerCount >= 18{
                        timer.upstream.connect().cancel()
                    }
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
