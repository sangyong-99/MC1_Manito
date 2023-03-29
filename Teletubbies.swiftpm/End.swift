//
//  End.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI

struct End: View {
    @State var sceneNumber = 1
    @State var timerCount = 0
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    @State var isTimerRunning = true
    
    @State var attack_xpos = 500
    @State var attack_ypos = 250
    @State var color_attack_xpos = 200
    @State var color_attack_ypos = 250
    
    @State var rainbow_opacity = false
    
    
    var body: some View {
        ZStack {
            ZStack{
                if sceneNumber == 1 { // 텔레토비와 몬스터 그냥 움직이기만 하고 대기
                    Image("rainbow").resizable().frame(width:800, height:400)
                        .opacity(rainbow_opacity ? 1.0 : 0.0)
                        .animation(.easeIn(duration:2.5), value: rainbow_opacity)
                    if change {
                        
                    }
                    else {
                        
                    }
                }
                else {
                    
                }
                
            }.onReceive(timer, perform: { value in
                currentDate = value
                
                change.toggle()
                timerCount += 1
                if timerCount > 3 {
                    rainbow_opacity = true
                }
                //timer.upstream.connect().cancel() 타이머 취소
            })
            
            Spacer()
            
        }
        .background(Image("background_school"))
    }
}

struct End_Previews: PreviewProvider {
    static var previews: some View {
        End()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
