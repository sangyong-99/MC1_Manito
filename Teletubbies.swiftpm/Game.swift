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
    @State var color_attack_ypos = 230
    
    @State var sceneChangeCount = 0
    
    @State var monsterOpacity = 1.0
    @State var monsterDeathDuration = 2.5
    
    @State var prefixSum = 1
    @State var attackSceneDuration = 0
    
    var body: some View {
        ZStack {
            ZStack{
                if sceneNumber == 1 { // 텔레토비랑 몬스터 대기
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(300))
                    
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 2 { // 텔레토비 <- 몬스터 공격 전달
                    Image("fireball").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(attack_xpos), y: CGFloat(attack_ypos))
                    
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(300))
                    
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                        
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 3 { // 텔레토비 <- 몬스터 공격 받음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(270), y: CGFloat(200))
                    
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(130), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(130), y: CGFloat(300))
                    
                    Image("bossMonster_basic").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(580), y: CGFloat(200))
                }
                else if sceneNumber == 4{ // 텔레토비랑 몬스터 대기
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(300))
                    
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 5 { // 텔레토비 -> 몬스터 공격 전달
                    Image("rainbow_apple").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(color_attack_xpos), y: CGFloat(color_attack_ypos))
                    
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(300))
                    
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                else if sceneNumber == 6{ // 텔레토비 -> 몬스터 공격 받음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(500), y: CGFloat(200)).zIndex(1)
                    
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(300))
                    
                    Image("bossMonster_attack").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(630), y: CGFloat(200))
                }
                if sceneNumber == 7{ // 텔레토비랑 몬스터 대기
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(300))
                    
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                if sceneNumber == 8{ // 텔레토비 <- 몬스터 공격 전달
                    Image("fireball").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(attack_xpos), y: CGFloat(attack_ypos))
                    
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(300))
                    
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                if sceneNumber == 9{ // 텔레토비 <- 몬스터 공격 받음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(270), y: CGFloat(200))
                    
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(130), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(130), y: CGFloat(300))
                    
                    Image("bossMonster_basic").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(580), y: CGFloat(200))
                }
                if sceneNumber == 10{ // 텔레토비랑 몬스터 대기
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(300))
                    
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                if sceneNumber == 11{ // 텔레토비 -> 몬스터 최후의 공격 전달
                    Image("rainbow_apple").resizable().frame(width:100, height:120)
                        .position(x: CGFloat(color_attack_xpos), y: CGFloat(color_attack_ypos))
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(300))
                    
                    if change {
                        Image("bossMonster_basic").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                    else {
                        Image("bossMonster_try").resizable().frame(width:400, height:300)
                            .position(x: CGFloat(580), y: CGFloat(200))
                    }
                }
                if sceneNumber == 12{ // 텔레토비 -> 몬스터 최후의 공격 받음
                    Image("attack_effect").resizable().frame(width:180, height:130)
                        .position(x: CGFloat(500), y: CGFloat(200)).zIndex(1)
                    
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(300))
                    
                    Image("bossMonster_attack").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(630), y: CGFloat(200))
                }
                if sceneNumber == 13{ // 최후의 공격 받은 몬스터 죽음
                    Image("threepeople1").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(180))
                    Image("threepeople2").resizable().frame(width:180, height:140)
                        .position(x: CGFloat(150), y: CGFloat(300))
                    
                    Image("bossMonster_attack").resizable().frame(width:400, height:300)
                        .position(x: CGFloat(630), y: CGFloat(200))
                        .opacity(monsterOpacity)
                        .animation(.easeIn(duration:monsterDeathDuration), value: monsterOpacity)
                }
                else { // 빈 화면
                    
                }
                
            }.onReceive(timer, perform: { value in
                currentDate = value
                
                change.toggle()
                timerCount += 1
                
                if sceneNumber == 1 {
                    sceneChangeCount += 1
                    if sceneChangeCount > 5 {
                        sceneNumber = 2
                        sceneChangeCount = 0
                    }
                }
                else if sceneNumber == 4 {
                    sceneChangeCount += 1
                    if sceneChangeCount > 5 {
                        sceneNumber = 5
                        sceneChangeCount = 0
                    }
                }
                else if sceneNumber == 7 {
                    sceneChangeCount += 1
                    if sceneChangeCount > 5 {
                        sceneNumber = 8
                        sceneChangeCount = 0
                    }
                }
                else if sceneNumber == 10 {
                    sceneChangeCount += 1
                    if sceneChangeCount > 5 {
                        sceneNumber = 11
                        sceneChangeCount = 0
                    }
                }
                else if sceneNumber == 13 {
                    monsterOpacity = 0
                    sceneChangeCount += 1
                    if sceneChangeCount > 5 {
                        sceneNumber = 14
                    }
                }
                else{
                    
                }
            }).onReceive(milli_timer, perform: { value in
                if sceneNumber == 2 {
                    prefixSum += 1
                    attack_xpos -= prefixSum
                    if attack_xpos < 200 {
                        sceneNumber = 3
                        prefixSum = 0
                    }
                }
                else if sceneNumber == 5 {
                    prefixSum += 1
                    color_attack_xpos += prefixSum
                    if color_attack_xpos > 500 {
                        sceneNumber = 6
                        prefixSum = 0
                    }
                }
                else if sceneNumber == 8 {
                    prefixSum += 1
                    attack_xpos -= prefixSum
                    if attack_xpos < 200 {
                        sceneNumber = 9
                        prefixSum = 0
                    }
                }
                else if sceneNumber == 11 {
                    prefixSum += 1
                    color_attack_xpos += prefixSum
                    if color_attack_xpos > 500 {
                        sceneNumber = 12
                        prefixSum = 0
                    }
                }
                
                if sceneNumber == 3 {
                    attackSceneDuration += 1
                    if attackSceneDuration > 3 {
                        attack_xpos = 500
                        attack_ypos = 250
                        attackSceneDuration = 0
                        sceneNumber = 4
                    }
                }
                else if sceneNumber == 6 {
                    attackSceneDuration += 1
                    if attackSceneDuration > 3 {
                        color_attack_xpos = 200
                        color_attack_ypos = 250
                        attackSceneDuration = 0
                        sceneNumber = 7
                    }
                }
                else if sceneNumber == 9 {
                    attackSceneDuration += 1
                    if attackSceneDuration > 3 {
                        attack_xpos = 500
                        attack_ypos = 250
                        attackSceneDuration = 0
                        sceneNumber = 10
                    }
                }
                else if sceneNumber == 12 {
                    attackSceneDuration += 1
                    if attackSceneDuration > 3 {
                        color_attack_xpos = 200
                        color_attack_ypos = 250
                        attackSceneDuration = 0
                        sceneNumber = 13
                    }
                }
            })
        }
        .background(Image("background").resizable().scaledToFill()).ignoresSafeArea()
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
