//
//  Scene9.swift
//  Teletubbies
//
//  Created by 이재혁 on 2023/03/27.
//

import SwiftUI

struct Game: View {
    @State var sceneNumber = 1
    @State var timerCount = 0
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let milli_timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = Date()
    @State var change: Bool = true
    @State var isTimerRunning = true
    
    @State var attack_xpos = 500
    @State var attack_ypos = 250
    @State var color_attack_xpos = 200
    @State var color_attack_ypos = 250
    
    
    var body: some View {
        ZStack {
            ZStack{
                if sceneNumber == 1 { // 텔레토비와 몬스터 그냥 움직이기만 하고 대기
                    if change {
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("monster").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                        
                    }
                    else {
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("monster").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 2{ // 몬스터가 텔레토비를 공격
                    Image("fireball").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(attack_xpos), y: CGFloat(attack_ypos))
                    
                    if change {
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("monster").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                        
                    }
                    else {
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("monster").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 3 { // 텔레토비가 몬스터한테 공격 받음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(270), y: CGFloat(200))
                    
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(80), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(120), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(160), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(80), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(120), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(160), y: CGFloat(200))
                    
                    Image("monster").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(580), y: CGFloat(200))
                }
                else if sceneNumber == 4{ // 텔레토비가 몬스터 공격
                    Image("fireball").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(color_attack_xpos), y: CGFloat(color_attack_ypos))
                    
                    if change {
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily1").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("monster").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                        
                    }
                    else {
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(300))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(100), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(140), y: CGFloat(200))
                        Image("Lily2").resizable().frame(width:70, height:100)
                            .position(x: CGFloat(180), y: CGFloat(200))
                        
                        Image("monster").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 5 { // 몬스터 텔레토비한테 공격 받음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(500), y: CGFloat(200)).zIndex(1)
                    
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(100), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(140), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(180), y: CGFloat(300))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(100), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(140), y: CGFloat(200))
                    Image("Lily1").resizable().frame(width:70, height:100)
                        .position(x: CGFloat(180), y: CGFloat(200))
                    
                    Image("monster").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(630), y: CGFloat(200))
                }
                else if sceneNumber == 6{ // 몬스터 죽음
                    
                }
                else {
                    
                }
                
            }.onReceive(timer, perform: { value in
                currentDate = value
                
                change.toggle()
                timerCount += 1
                
                if sceneNumber == 1 {
                    
                }
                if sceneNumber == 1 && timerCount >= 12 {
                    sceneNumber = 2
                    //timer.upstream.connect().cancel()
                }
                if sceneNumber == 3 {
                    attack_xpos = 500
                    attack_ypos = 250
                    sceneNumber = 1
                    
                }
                if sceneNumber == 5 {
                    attack_xpos = 500
                    attack_ypos = 250
                    sceneNumber = 1
                    
                }
                if sceneNumber == 2 {
                    attack_xpos -= 20
                    if attack_xpos < 200 {
                        sceneNumber = 3
                    }
                }
                if sceneNumber == 4 {
                    color_attack_xpos += 20
                    if color_attack_xpos > 500 {
                        sceneNumber = 5
                    }
                }
                //timer.upstream.connect().cancel() 타이머 취소
            }).onReceive(milli_timer, perform: { value in
                
            })
            Spacer()
            
        }
        .background(Image("background").resizable().scaledToFill()).ignoresSafeArea()
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
            .previewInterfaceOrientation(.landscapeRight
            )
    }
}
